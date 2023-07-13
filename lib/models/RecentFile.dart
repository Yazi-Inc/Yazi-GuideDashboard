class RecentFile {
  final String? icon, title, date, size, thumbnail;

  RecentFile({this.icon, this.title, this.date, this.size, this.thumbnail});
}

List demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/xd_file.svg",
    title: "XD File",
    date: "01-03-2023",
    size: "3.5mb",
    thumbnail:
        "https://api.lsbdata.com/uploads/tp_xd_1320x660_corrupted_4d785154b2.jpeg",
  ),
  RecentFile(
    icon: "assets/icons/Figma_file.svg",
    title: "Figma File",
    date: "27-02-2023",
    size: "19.0mb",
    thumbnail: "https://help.figma.com/hc/article_attachments/1500007422402",
  ),
  RecentFile(
      icon: "assets/icons/doc_file.svg",
      title: "Document",
      date: "23-02-2023",
      size: "32.5mb",
      thumbnail:
          "https://media.istockphoto.com/id/1359932120/vector/contract-document-icon-in-flat-style-report-with-folder-vector-illustration-on-isolated.jpg?s=612x612&w=0&k=20&c=eJUJzNLAWNHutYtNiX1x0ORNXMpOriOMH0S4aX0vUm0="),
  RecentFile(
    icon: "assets/icons/sound_file.svg",
    title: "Sound File",
    date: "21-02-2023",
    size: "3.5mb",
    thumbnail:
        "https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/10/wav-audio-file-2.jpg",
  ),
  RecentFile(
    icon: "assets/icons/media_file.svg",
    title: "Media File",
    date: "23-02-2023",
    size: "2.5gb",
    thumbnail: "https://www.mediafire.com/images/logos/mf_logo250x250.png",
  ),
  RecentFile(
    icon: "assets/icons/pdf_file.svg",
    title: "Sales PDF",
    date: "25-02-2023",
    size: "3.5mb",
    thumbnail:
        "https://i0.wp.com/www.alphr.com/wp-content/uploads/2021/09/How-to-Convert-Photos-to-PDF.png?fit=3786%2C3029&ssl=1",
  ),
];
