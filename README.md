# NRC (Nike Running Club)

## 🍎 작동 화면
| 작동 화면 |
|:-:|
| ![](https://i.imgur.com/XBj1mIn.gif) |

## 🍎 collectionView의 Scroll Direction과 paging Enabled
- 지금까지 사용 해보았던 collection뷰들은 대부분 하단 좌측의 GIF 처럼 작동했다.
- scroll direction과 paging enabled을 설정해주니 하단 우측의 GIF 처럼 작동한다.

| Scroll Direction : Vertical 및 paging Enabled = false | Scroll Direction : Horizontal 및 paging Enabled = true |
| :-: | :-: |
| ![](https://i.imgur.com/sV6IKWM.gif) | ![](https://i.imgur.com/XBj1mIn.gif) |
- 설정할 수 있는곳 (스토리보드)
![](https://i.imgur.com/SjzWPmG.png)



## 🍎 UIPageControl 사용법
1. 스토리보드에서 Page Control을 찾아 View에 넣어준다. (적용 시 아래와 같은 그림을 볼 수 있다.)

![](https://i.imgur.com/Bk76wnZ.png)


3. 사용 하고자 하는 VC에 pageControl을 연결해준다. (아래 참고)
```swift
class OnboardingViewController: UIViewController {
    
    ...
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    ...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ...
        
        pageControl.numberOfPages = messages.count
        pageControl.currentPage = 0
    }
}
```
- 총 몇개의 페이지를 보여줄것인지 정하는 프로퍼티
    ```swift
    pageControl.numberOfPages = messages.count
    ```
- 현재 페이지를 정하는 프로퍼티
    ```swift
    pageControl.currentPage = 0
    ```

## 🍎 pageControl과 collectionView의 관계 
![](https://i.imgur.com/qo1r0Uk.gif)
```swift
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        pageControl.currentPage = index
    }
}
```

- 화면을 스와이핑 하는것은 collectionView를 제어하는것.
- collectionView의 위치에 따라 아래와 같이 계산 후 pageControl의 currentPage를 설정해서 pageControl이 움직이는 것처럼 보이게 함.
- 위 GIF를 기반으로 index를 계산해보자 (아이폰13 프로의 넓이는 390포인트이다.)
    - index = Int(0.0 / 390.0) = 0
    - index = Int(390.0 / 390.0) = 1
    - index = Int(780.0 / 390.0) = 2
- 이렇게 페이지가 넘어갈때마다 원점으로 부터 얼만큼 떨어져있는지 측정 후 13 프로의 넓이를 나눈 값으로 currentPage에 넣어주고 있는것이다.

## 🍎 collectionView는 UIScrollViewDelegate와 무슨 연관이 있을까?
- UICollectionView는 UIScrollView의 서브클래스.
- UIScrollViewDelegate 프로토콜을 채택하는 코드 내 scrollViewDidEndDecelerating 메서드는 스크롤이 완전히 멈추었을때 발동되는 메서드다.
- 즉, UIScrollViewDelegate 프로토콜을 채택하고 scrollViewDidEndDecelerating을 구현해주면 collectionView를 scrollView처럼 감지 할 수 있다. [출처](https://stackoverflow.com/questions/14868269/uicollectionview-how-to-detect-when-scrolling-has-stopped)

## 🍎 Citation
[scrollViewDidEndDecelerating 관련](https://stackoverflow.com/questions/14868269/uicollectionview-how-to-detect-when-scrolling-has-stopped)
