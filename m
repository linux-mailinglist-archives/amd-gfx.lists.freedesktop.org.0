Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6951B2276
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Sep 2019 16:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B296F3D6;
	Fri, 13 Sep 2019 14:46:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2019 14:46:30 UTC
Received: from mail.ud03.udmedia.de (ud03.udmedia.de [194.117.254.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBD56F3D2
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Sep 2019 14:46:30 +0000 (UTC)
Received: (qmail 13324 invoked from network); 13 Sep 2019 16:39:48 +0200
Received: by mail.ud03.udmedia.de with ESMTPA; 13 Sep 2019 16:39:48 +0200
X-UD-Smtp-Session: ud03?335p7@6CPlOXCSkp3Cdf4e
MIME-Version: 1.0
Date: Fri, 13 Sep 2019 16:39:48 +0200
From: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <Dieter@nuetzel-hh.de>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: =?UTF-8?Q?Re=EF=BC=9A=5BPATCH=5D_drm/amdgpu=3A_resvert_=22disabl?=
 =?UTF-8?Q?e_bulk_moves_for_now=22?=
Message-ID: <7bfab4f392a00cefb34d4fefce9095ca@nuetzel-hh.de>
X-Sender: Dieter@nuetzel-hh.de
User-Agent: Roundcube Webmail/1.3.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=nuetzel-hh.de;
 h=
 mime-version:content-type:content-transfer-encoding:date:from:to
 :cc:subject:message-id; s=k1; bh=TdAV1g1WoKq1Z2pdtnNN+2OkBnmPdiU
 GVMtUmW6TL78=; b=EeGb6+FGAErKXYOtkKp/pEn8VSxEKYQH4h686b2EAFOHvJ9
 Ufm2zizdRcZJZ4F9PMVkEkxp8Lh/gTDX07f7VT78E5YcLxW0mh7Qm2SiuYV3EP5i
 cwXyCvHShneu0D+pqe+Bin90U56XAJpnUc1q6lrfQ2O0aBUf+g6g1UeYdWPw=
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
Cc: amd-devel <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8gQ2hyaXN0aWFuIGFuZCBEYXZpZCwKCkkndmUgcnVubmluZyBBbGV4J3MgJ2FtZC1zdGFn
aW5nLWRybS1uZXh0JyB3aXRoIGl0IGVuYWJsZWQuCkdyZWF0IG51bWJlcnMgd2l0aCB2a21hcmsg
KHJhZHYpIGFuZCBnbG1hcmsyLgoKU2FkbHkgJ2FtZC1zdGFnaW5nLWRybS1uZXh0JyBzdGlsbCBz
dGFuZHMgb24gNS4yLjAtcmMxIC0gbm8gY2hhbmdlcyAKZHVyaW5nIHRoZSBsYXN0IDIgd2Vla3Mu
CklzIEFsZXggb24gdmFjYXRpb24vdHJhdmVsaW5nPwoKR3JlZXRpbmdzLApEaWV0ZXIKClstXQpa
aG91LCBEYXZpZChDaHVuTWluZykgRGF2aWQxLlpob3UgYXQgYW1kLmNvbQpUaHUgU2VwIDEyIDE1
OjE4OjQzIFVUQyAyMDE5CgpJIGRvbnQga25vdyBka21zIHN0YXR1c++8jGFueXdheSwgd2Ugc2hv
dWxkIHN1Ym1pdCB0aGlzIG9uZSBhcyBlYXJseSBhcyAKcG9zc2libGUuCgotLS0tLS0tLSDljp/l
p4vpgq7ku7YgLS0tLS0tLS0K5Li76aKY77yaUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmVzdmVy
dCAiZGlzYWJsZSBidWxrIG1vdmVzIGZvciBub3ciCuWPkeS7tuS6uu+8mkNocmlzdGlhbiBLw7Zu
aWcK5pS25Lu25Lq677yaIlpob3UsIERhdmlkKENodW5NaW5nKSIgLGFtZC1nZnggYXQgbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCuaKhOmAge+8mgoKSnVzdCB0byBkb3VibGUgY2hlY2s6IFdlIGRvIGhh
dmUgdGhhdCBlbmFibGVkIGluIHRoZSBES01TIHBhY2thZ2UgZm9yIGEKd2hpbGUgYW5kIGRvZXNu
J3QgZW5jb3VudGVyIGFueSBtb3JlIHByb2JsZW1zIHdpdGggaXQsIGNvcnJlY3Q/CgpUaGFua3Ms
CkNocmlzdGlhbi4KCkFtIDEyLjA5LjE5IHVtIDE2OjAyIHNjaHJpZWIgQ2h1bm1pbmcgWmhvdToK
PiBSQiBvbiBpdCB0byBnbyBhaGVhZC4KPiAKPiAtRGF2aWQKPiAKPiDlnKggMjAxOS85LzEyIDE4
OjE1LCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPj4gVGhpcyByZXZlcnRzIGNvbW1pdCBhMjEz
YzJjN2UyMzVjZmMwZTBhMTYxYTU1OGY3ZmRmMmZiM2E2MjRhLgo+PiAKPj4gVGhlIGNoYW5nZXMg
dG8gZml4IHRoaXMgc2hvdWxkIGhhdmUgbGFuZGVkIGluIDUuMS4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWcgYXQgYW1kLmNvbT4KPj4gLS0t
Cj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMiAtLQo+PiAg
ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiBpbmRleCA0ODM0OWU0ZjA3MDEuLmZkM2ZiYWE3M2Zh
MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPj4gQEAgLTYw
MywxNCArNjAzLDEyIEBAIHZvaWQgYW1kZ3B1X3ZtX21vdmVfdG9fbHJ1X3RhaWwoc3RydWN0IAo+
PiBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICAgICBzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xv
YiA9IGFkZXYtPm1tYW4uYmRldi5nbG9iOwo+PiAgICAgICBzdHJ1Y3QgYW1kZ3B1X3ZtX2JvX2Jh
c2UgKmJvX2Jhc2U7Cj4+IAo+PiAtI2lmIDAKPj4gICAgICAgaWYgKHZtLT5idWxrX21vdmVhYmxl
KSB7Cj4+ICAgICAgICAgICAgICAgc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+ICAgICAg
ICAgICAgICAgdHRtX2JvX2J1bGtfbW92ZV9scnVfdGFpbCgmdm0tPmxydV9idWxrX21vdmUpOwo+
PiAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+ICAgICAgICAg
ICAgICAgcmV0dXJuOwo+PiAgICAgICB9Cj4+IC0jZW5kaWYKPj4gCj4+ICAgICAgIG1lbXNldCgm
dm0tPmxydV9idWxrX21vdmUsIDAsIHNpemVvZih2bS0+bHJ1X2J1bGtfbW92ZSkpOwo+PiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
