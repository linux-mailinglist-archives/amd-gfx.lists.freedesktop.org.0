Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12771A7C82
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 09:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6B89206;
	Wed,  4 Sep 2019 07:16:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Tue, 03 Sep 2019 07:43:15 UTC
Received: from qq.com (smtpbg403.qq.com [113.96.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29986896A3
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 07:43:14 +0000 (UTC)
X-QQ-FEAT: wQjLNy5F2LEdw3PONwfLCjyNQeAo+F1W7XIVBBmEXNUyeUFZFETB4S9lYUMhZ
 FJXDZ0LqBEWwEf1Y4uu4kl5OJ/qTP575b431xDtXzIyYEJ2Hv6OVN+RKXqzUD4B3Yo7FQsi
 7rWhFTm/J0RAevgcFWw1BNKZ8hlDrUrnWFNc/JBw5o7s1L2FCcUlnwj/fhsWe4nXUcdbxb6
 vwQF+qeu4BFXVkjE+F8Li3tl/vn3p4/ISP+X2FBKUavicD43r7U97U79VtUhCtf+Iu5VsKB
 d6KQHD60mBt2BP
X-QQ-SSF: 00000000000000F000000000000000V
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 117.27.69.205
X-QQ-STYLE: 
X-QQ-mid: webmail447t1567496125t590481
From: "=?gb18030?B?Nzg2NjY2Nzk=?=" <78666679@qq.com>
To: "=?gb18030?B?YW1kLWdmeA==?=" <amd-gfx@lists.freedesktop.org>
Subject: Bug: amdgpu drm driver cause process into Disk sleep state
Mime-Version: 1.0
Date: Tue, 3 Sep 2019 15:35:25 +0800
X-Priority: 3
Message-ID: <tencent_4DEABBEB3BB4C6A6D84CA9F0DB225FBF5809@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 03 Sep 2019 15:35:27 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:16:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1567496127; bh=Mm96JDKtDJJcdTbsfR5CVY9PDLzgS0qmk/YRCGgQijk=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=R9/NRN3+ANifVBIWassfn1OD43+VGQ5RAtnlvAA97a6GP5xhx6kUiyVDKFBy3Poo9
 abUdTiSWycFDA3fQ5CXz+E/zaPLV6GZQJudoI1zQQTDNkYeJlhLYZ3J/nVzyGosgI0
 qVdtFNC2vzuWj5lQHhdq7t6fh4W8ouhS+we756Ys=
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: =?gb18030?B?YWxleGFuZGVyLmRldWNoZXI=?= <alexander.deucher@amd.com>,
 =?gb18030?B?Q2hyaXN0aWFuIEuBMIsybmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksIFNpcnM6CiAgICAgICBJIGhhdmUgYSB3eDUxMDAgYW1kZ3B1IGNhcmQsIEl0IHJhbmRvbWx5
IGNvbWUgaW50byBmYWlsdXJlLiAgc29tZXRpbWVzLCBpdCB3aWxsIGNhdXNlIHByb2Nlc3NlcyBp
bnRvIHVuaW50ZXJydXB0aWJsZSB3YWl0IHN0YXRlLgoKCmNwcy1uZXctb25kZW1hbmQtMDU4Nzp+
ICMgcHMgYXV4fGdyZXAgLXcgRApyb290ICAgICAgMTEyNjggIDAuMCAgMC4wIDI2MDYyOCAgMzUx
NiA/ICAgICAgICBTc2wgIDjmnIgyNiAgIDA6MDAgL3Vzci9zYmluL2dzc3Byb3h5IC1ECnJvb3Qg
ICAgIDEzNjQ4MiAgMC4wICAwLjAgMjEyNTAwICAgNTcyIHB0cy8wICAgIFMrICAgMTU6MjUgICAw
OjAwIGdyZXAgLS1jb2xvcj1hdXRvIC13IEQKcm9vdCAgICAgMzcwNjg0ICAwLjAgIDAuMCAgMTc5
NzIgIDc0MjggPyAgICAgICAgU3MgICA55pyIMDIgICAwOjA0IC91c3Ivc2Jpbi9zc2hkIC1ECjEw
MDY2ICAgIDQzMjk1MSAgMC4wICAwLjAgICAgICAwICAgICAwID8gICAgICAgIEQgICAgOeaciDAy
ICAgMDowMCBbRmFrZUZpbmFsaXplckRhXQpyb290ICAgICA0OTY3NzQgIDAuMCAgMC4wICAgICAg
MCAgICAgMCA/ICAgICAgICBEICAgIDnmnIgwMiAgIDA6MTcgW2t3b3JrZXIvODoxK2V2ZV0KY3Bz
LW5ldy1vbmRlbWFuZC0wNTg3On4gIyBjYXQgL3Byb2MvNDk2Nzc0L3N0YWNrIApbPDA+XSBfX3N3
aXRjaF90bysweDk0LzB4ZTgKWzwwPl0gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCsweGY4LzB4MjQ4
IFtncHVfc2NoZWRdCls8MD5dIGFtZGdwdV9jdHhfbWdyX2VudGl0eV9mbHVzaCsweGFjLzB4MTQ4
IFthbWRncHVdCls8MD5dIGFtZGdwdV9mbHVzaCsweDJjLzB4NTAgW2FtZGdwdV0KWzwwPl0gZmls
cF9jbG9zZSsweDQwLzB4YTAKWzwwPl0gcHV0X2ZpbGVzX3N0cnVjdCsweDExOC8weDEyMApbPDA+
XSBwdXRfZmlsZXNfc3RydWN0KzB4MzAvMHg2OCBbYmluZGVyX2xpbnV4XQpbPDA+XSBiaW5kZXJf
ZGVmZXJyZWRfZnVuYysweDRkNC8weDY1OCBbYmluZGVyX2xpbnV4XQpbPDA+XSBwcm9jZXNzX29u
ZV93b3JrKzB4MWI0LzB4M2Y4Cls8MD5dIHdvcmtlcl90aHJlYWQrMHg1NC8weDQ3MApbPDA+XSBr
dGhyZWFkKzB4MTM0LzB4MTM4Cls8MD5dIHJldF9mcm9tX2ZvcmsrMHgxMC8weDE4Cls8MD5dIDB4
ZmZmZmZmZmZmZmZmZmZmZgoKCgpUaGlzIGlzc3VlIHRyb3VibGVkIG1lIGEgbG9uZyB0aW1lLiAg
bG9va2luZyBlYWdlcmx5IHRvIGdldCBoZWxwIGZyb20geW91IQoKCi0tLS0tCllhbmh1YQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
