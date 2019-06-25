Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F000C553C8
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 17:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E7D6E154;
	Tue, 25 Jun 2019 15:54:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAC176E156
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 15:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 285BC2A6046
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 17:54:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id E7Ia1UaKodiR for <amd-gfx@lists.freedesktop.org>;
 Tue, 25 Jun 2019 17:54:46 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id B02C52A6045
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 17:54:46 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hfnmQ-0003X2-8w
 for amd-gfx@lists.freedesktop.org; Tue, 25 Jun 2019 17:54:46 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati] present: Check that we can get a KMS FB for
 flipping
Date: Tue, 25 Jun 2019 17:54:46 +0200
Message-Id: <20190625155446.13533-1-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpUaGlzIGNhbiBs
ZWdpdGltYXRlbHkgZmFpbCBpZiB0aGUgcGl4bWFwJ3Mgc3RvcmFnZSBpcyBzaGFyZWQgZnJvbQph
bm90aGVyIGRldmljZSwgZS5nLiB3aGVuIHVzaW5nIFBSSU1FIHJlbmRlciBvZmZsb2FkaW5nLgoK
KFBvcnRlZCBmcm9tIGFtZGdwdSBjb21taXQgN2QzZmVmNzJlMGM4NzFlMTY3N2U5ZTU0NGY0Y2Fl
NWUyMzhiNWM1MikKClNpZ25lZC1vZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwuZGFlbnpl
ckBhbWQuY29tPgotLS0KIHNyYy9yYWRlb24uaCAgICAgICAgIHwgIDEgKwogc3JjL3JhZGVvbl9w
cmVzZW50LmMgfCAxOCArKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NyYy9yYWRlb24uaCBiL3NyYy9yYWRlb24uaAppbmRl
eCAwMDhhNTlmM2EuLjJjOTEzNDY2NyAxMDA2NDQKLS0tIGEvc3JjL3JhZGVvbi5oCisrKyBiL3Ny
Yy9yYWRlb24uaApAQCAtMzA5LDYgKzMwOSw3IEBAIHN0cnVjdCByYWRlb25fcGl4bWFwIHsKIAog
CXN0cnVjdCByYWRlb25fYnVmZmVyICpibzsKIAlzdHJ1Y3QgZHJtbW9kZV9mYiAqZmI7CisJQm9v
bCBmYl9mYWlsZWQ7CiAKIAl1aW50MzJfdCB0aWxpbmdfZmxhZ3M7CiAKZGlmZiAtLWdpdCBhL3Ny
Yy9yYWRlb25fcHJlc2VudC5jIGIvc3JjL3JhZGVvbl9wcmVzZW50LmMKaW5kZXggMzhhOWE2Yjc5
Li40OTQ2NTVjOTEgMTAwNjQ0Ci0tLSBhL3NyYy9yYWRlb25fcHJlc2VudC5jCisrKyBiL3NyYy9y
YWRlb25fcHJlc2VudC5jCkBAIC0yNTQsNiArMjU0LDcgQEAgcmFkZW9uX3ByZXNlbnRfY2hlY2tf
ZmxpcChSUkNydGNQdHIgY3J0YywgV2luZG93UHRyIHdpbmRvdywgUGl4bWFwUHRyIHBpeG1hcCwK
ICAgICB4Zjg2Q3J0Y1B0ciB4Zjg2X2NydGMgPSBjcnRjLT5kZXZQcml2YXRlOwogICAgIFNjcmVl
blB0ciBzY3JlZW4gPSB3aW5kb3ctPmRyYXdhYmxlLnBTY3JlZW47CiAgICAgU2NybkluZm9QdHIg
c2NybiA9IHhmODZfY3J0Yy0+c2NybjsKKyAgICBzdHJ1Y3QgcmFkZW9uX3BpeG1hcCAqcHJpdiA9
IHJhZGVvbl9nZXRfcGl4bWFwX3ByaXZhdGUocGl4bWFwKTsKICAgICB4Zjg2Q3J0Y0NvbmZpZ1B0
ciBjb25maWcgPSBYRjg2X0NSVENfQ09ORklHX1BUUihzY3JuKTsKICAgICBSQURFT05JbmZvUHRy
IGluZm8gPSBSQURFT05QVFIoc2Nybik7CiAgICAgUGl4bWFwUHRyIHNjcmVlbl9waXhtYXAgPSBz
Y3JlZW4tPkdldFNjcmVlblBpeG1hcChzY3JlZW4pOwpAQCAtMjc3LDYgKzI3OCwyMyBAQCByYWRl
b25fcHJlc2VudF9jaGVja19mbGlwKFJSQ3J0Y1B0ciBjcnRjLCBXaW5kb3dQdHIgd2luZG93LCBQ
aXhtYXBQdHIgcGl4bWFwLAogCXJldHVybiBGQUxTRTsKICNlbmRpZgogCisgICAgaWYgKHByaXYg
JiYgcHJpdi0+ZmJfZmFpbGVkKQorCXJldHVybiBGQUxTRTsKKworICAgIGlmICghcmFkZW9uX3Bp
eG1hcF9nZXRfZmIocGl4bWFwKSkgeworCWlmICghcHJpdikKKwkgICAgcHJpdiA9IHJhZGVvbl9n
ZXRfcGl4bWFwX3ByaXZhdGUocGl4bWFwKTsKKworCWlmIChwcml2ICYmICFwcml2LT5mYl9mYWls
ZWQpIHsKKwkgICAgeGY4NkRydk1zZyhzY3JuLT5zY3JuSW5kZXgsIFhfV0FSTklORywKKwkJICAg
ICAgICJDYW5ub3QgZ2V0IEZCIGZvciBQcmVzZW50IGZsaXAgKG1heSBiZSAiCisJCSAgICAgICAi
bm9ybWFsIGlmIHVzaW5nIFBSSU1FIHJlbmRlciBvZmZsb2FkaW5nKVxuIik7CisJICAgIHByaXYt
PmZiX2ZhaWxlZCA9IFRSVUU7CisJfQorCisJcmV0dXJuIEZBTFNFOworICAgIH0KKwogICAgIC8q
IFRoZSBrZXJuZWwgZHJpdmVyIGRvZXNuJ3QgaGFuZGxlIGZsaXBwaW5nIGJldHdlZW4gQk9zIHdp
dGggZGlmZmVyZW50CiAgICAgICogdGlsaW5nIHBhcmFtZXRlcnMgY29ycmVjdGx5IHlldAogICAg
ICAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
