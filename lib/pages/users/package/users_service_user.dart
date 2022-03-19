import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'users_wast_user.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '服务使用协议',
          style: TextStyle(fontFamily: 'MyFontStyle', color: Colors.black),
        ),
        leading: TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Dty()));
          },
          // padding: EdgeInsets.all(10),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),

          // padding: EdgeInsets.zero,
        ),
      ),
      body: const Thetext(),
    );
  }
}

class Thetext extends StatelessWidget {
  const Thetext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      //内间距
      child: Stack(
        //重叠的Stack Widget，实现重叠
        children: <Widget>[
          Center(
            child: BackdropFilter(
              //背景滤镜器
              filter: ImageFilter.blur(
                sigmaX: 0.5,
              ), //图片模糊过滤，横向竖向都设置5.0
              child: Opacity(
                //透明控件
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/OIP-TY.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
              width: 1.sw,
              height: 1.sh,
              child: ListView(
                children: const [
                  Text('陆向谦实验室会员协议 ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  Text('一、协议确认 ',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Text(
                      '欢迎您使用陆向谦实验室会员服务！陆向谦实验室会员服务由视算新里程科技(北京)有限公司（以下亦称“实验室”）向您提供，注册地址为：北京市海淀区清华大学学研大厦A座1005室。《陆向谦实验室会员协议》（以下亦称“本协议”）由您（以下亦称“您”或“学员”）和实验室进行缔结，对双方具有同等法律效力。实验室建议您仔细阅读本协议的全部内容，尤其是以加粗形式展示的，与您的权益（可能）存在重大关系的条款（包括相关约定实验室责任、您享有的权利、争议解决方式及司法管辖等条款），请您留意重点阅读。若您认为本协议中的加粗条款可能会导致您的部分或全部权利或利益受损，请您务必再次仔细阅读，在确保您已经理解、接受了加粗条款的前提下，继续使用实验室会员服务。如果您不同意本协议的任一或全部条款内容，请不要以确认形式（包括但不限于支付行为/接受赠与、或完成了成为会员的全部程序而在此过程中未向实验室提出关于本协议的任何异议）进行下一步操作或使用实验室会员服务。当您以确认形式进行下一步操作或使用实验室会员服务时，即表示您与实验室已达成协议关系，您自愿接受本协议并遵守本协议项下的全部约定。您承诺接受并遵循本协议的约定，若发生争议，不得以未阅读本协议的内容等理由，主张本协议无效或要求撤销本协议。实验室有权变更本协议内容，一旦本协议内容发生变更的，实验室将在相应页面、站内信或以其他合理方式进行通知，请您仔细阅读。如果您不同意变更的内容的，您可以选择停止使用会员服务。如您继续使用会员服务的，则视为您已经同意变更的全部内容。更新后的协议自文首更新之日起生效。若您是未成年人，请您在监护人监护、指导下阅读并决定是否同意本协议。若您不具备相应主体资格，因此导致的一切后果将由您的监护人承担，甲方有权利向您及您的监护人索取相应的损失。二、服务内容1.陆向谦创新创业实验室试用会员：1.1陆向谦创新创业实验室试用会员加入方法：通过申请陆向谦创新创业实验室春、夏、秋、冬季训练营中的任意一期1.2试用会员权限：1）试用会员将被邀请加入企业微信/飞书会议等平台组建的群聊，授课者将在授课前将课程入口链接公布于该群聊内，学员通过链接进入会议软件，接受直播授课；2）试用会员有权访问实验室往期所有的课程资源1.3陆向谦创新创业实验室试用会员费用：自2022.1.1起，4500/期/人,2.陆向谦创新创业实验室正式会员：2.1陆向谦创新创业实验室正式会员加入方法1）通过训练营选拔加入2）经实验室学员推荐，陆向谦教授批准，可免训练营选拔加入2.2陆向谦创新创业实验室正式会员权益1）陆向谦教授1对1咨询服务2）其他权益同试用会员2.3陆向谦创新创业实验室正式会员费用自2022.1.1起，13000/年/人三、费用支付1.费用支付后，需遵守陆向谦实验室相关规定。服务一旦开始，会员费概不退还。2.学员可以通过网银、支付宝、银联等方式进行会员费用的支付，在授课者收到学员款项后开通相应的会员服务。四、行为规范和违约处理1.   在您使用实验室会员服务的过程中，不得存在以下行为：1.1  未经实验室明确授权，通过技术手段对服务内容、服务期限、消费金额、交易状态等信息进行修改；1.2  将实验室会员服务通过非实验室明确授权的方式（包括但不限于借用、租用、售卖、分享、转让）提供他人使用；1.3  未经实验室明确授权，将实验室会员服务提供的视频、软件、程序、代码以及内容（包括但不限于文字、说明、图画、图片、图形、录像、图表、课程资源、页面设计等）的全部或部分进行复制、下载、上传、修改、编目排序、翻译、发行、开发、转让、销售、展示、传播、合成、嵌套、链接、创作衍生作品、进行商业开发或推广等；1.4  对实验室用于保护实验室会员服务的任何安全措施技术进行破解、更改、反操作、篡改或其他破坏；1.5  未经实验室事先书面同意，删除实验室会员服务内容上的任何所有权或知识产权声明或标签；1.6  未经实验室明确授权，采用收费或免费的方式，在任何公开场合全部或部分展示实验室会员服务内容（但如您的上述行为不构成侵权的除外）；1.7  其他未经实验室明示授权许可或违反本协议、法律法规或监管政策、侵犯第三方或实验室合法权益的行为。1.8 非经授课者及其他权利人事先书面同意，学员不得重制、公开传播、公开传送、公开上映、改作、编辑、转载、链接、引用、抓取、解编、反向破译、或其他方式之使用。如有违反，除应承担法律责任外，还应承担对授课者造成的全部损失。2.   您知悉并同意，如您存在任何违反国家法律法规或监管政策、违反本协议或有损实验室或/及其关联公司的声誉、利益的行为的，实验室有权采取以下一项或多项处理措施：2.1  如本协议对此行为有单独条款约定处理方式的，按照该条款处理；2.2  采取一种或多种措施制止您的行为及行为产生的后果，如删除/屏蔽相关链接或内容、限制/取消您的会员权益/账户使用权限等；2.3  中断或终止部分或全部实验室会员服务，且您已交纳的实验室会员服务费用将不予退还且不获得任何形式的补偿/赔偿；2.4  如您的行为使实验室或/及其关联公司遭受任何损失的，您应当承担全部损失赔偿责任并在实验室要求的时限内完成费用支付。 五、协议的终止和中断1.本服务的中断或终止包括如下情况：1.1  您主动提出要求的；1.2  您存在任何违反国家法律法规或监管政策、违反本协议或有损实验室或/及其关联公司的声誉、利益的行为的；1.3  实验室根据法律法规、监管政策的规定或有权机关的要求；1.4  实验室为维护账号与系统安全等紧急情况之需要；1.5  不可抗力（不可抗力是指：不能预见、不能避免且不能客服的客观情况，包括国家法律、法规、政策及国家机关的命令及其他政府行为或者其它的诸如台风、洪水、地震、海啸、战争、罢工等）；1.6  其他实验室无法抗拒的情况。2.学员一经参与训练营，无法定原因不得终止中断本协议或主张本协议无效；若学员自行退出训练营，学员费概不退还；3.陆向谦训练营课程永久有效，学员可在学员关系存续期间共享内部教学资源；4.授课者对学员在授课过程中的不当行为或其他授课者认为应当终止服务的情况，授课者有权随时作出删除相关信息、中止服务提供等处理，而无须征得学员同意。六、争议解决1.协议中有其他未尽事宜或执行过程中发生的其他问题应由双方协议解决；2.争议问题系学员过失的，学员费用概不退还；3.训练营最终解释权归属于陆向谦实验室所有。七、其他事宜1.授课者有权根据法律法规的变化、网站、软件的相关要求，不时地对本协议的内容进行修改。修改后的协议一经公布，即代替原来的协议，学员可随时有求查阅。2.学员有义务阅读最新版的协议及网站公告。若学员继续使用授课者提供的服务，即视为同意更新后的协议。3.本协议自授课者收到学员款项后生效。4.本协议所有条款的标题仅为方便而设，不具法律或契约效果。5.如本协议因与中华人民共和国现行法律相抵触而导致部分无效的，不影响协议的其他部分的效力。6.本协议的标题仅为方便及阅读而设，并不影响正文中任何条款的含义或解释。八、乙方义务乙方必须遵循：遵守所有使用网络服务的网络协议、规定、程序和惯例，不得使用实验室平台从事违法活动，如：1) 违反宪法或法律法规规定的；2) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；3) 损害国家荣誉和利益的，损害公共利益的；4) 煽动民族仇恨、民族歧视，破坏民族团结的；5) 破坏国家宗教政策，宣扬邪教和封建迷信的；6) 散布谣言，扰乱社会秩序，破坏社会稳定的；7) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；8) 侮辱或者诽谤他人，侵害他人合法权益的；9) 含有法律、行政法规禁止的其他内容的。不得干扰其他学员接受训练营服务，如：1) 发布与训练营无关的广告；2) 干扰训练营正常进度；乙方购买的会员服务只允许个人使用、不能用于其他目的违反以上任何一项义务，陆向谦实验室有权取消乙方学员资格。由于乙方自身原因造成的训练营无法继续等损失，陆向谦实验室对此概不负责。'),
                ],
              )),
        ],
      ),
    );
    //Container(
    //   margin: EdgeInsets.all(5.0),
    //   //内间距

    //   child: Stack(
    //     //重叠的Stack Widget，实现重贴
    //     children: <Widget>[
    //       ConstrainedBox(
    //           //约束盒子组件，添加额外的限制条件到 child上。
    //           constraints: const BoxConstraints.expand(), //限制条件，可扩展的。
    //           child: Image.asset(
    //             'assets/images/OIP-TY.jpg',
    //             fit: BoxFit.contain,
    //           )),
    //       Center(
    //         child: ClipRect(
    //           //裁切长方形
    //           child: BackdropFilter(
    //             //背景滤镜器
    //             filter: ImageFilter.blur(
    //               sigmaX: 0.5,
    //             ), //图片模糊过滤，横向竖向都设置5.0
    //             child: Opacity(
    //               //透明控件
    //               opacity: 0.5,
    //               child: Container(
    //                 // 容器组件
    //                 width: 500.0,
    //                 height: 700.0,
    //                 decoration: BoxDecoration(
    //                     color: Colors.grey.shade200), //盒子装饰器，进行装饰，设置颜色为灰色
    //                 child: Center(
    //                     child: ListView(
    //                   children: const [
    //                     ListTile(

    //                     ),
    //                     ListTile(

    //                     ),
    //                     ListTile(

    //                   ],
    //                 )),
    //               ),
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}