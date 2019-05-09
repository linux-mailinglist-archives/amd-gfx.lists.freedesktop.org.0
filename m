Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D011886E
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 12:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4899489264;
	Thu,  9 May 2019 10:38:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E2A689264
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 10:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7EA022AA104
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 12:38:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id N-5W1RG5BiLe for <amd-gfx@lists.freedesktop.org>;
 Thu,  9 May 2019 12:38:21 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 1421E2AA0CA
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 12:38:21 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hOgRQ-0000xk-NC
 for amd-gfx@lists.freedesktop.org; Thu, 09 May 2019 12:38:20 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati] dri3: Always flush glamor before sharing
 pixmap storage with clients
Date: Thu,  9 May 2019 12:38:20 +0200
Message-Id: <20190509103820.3657-1-michel@daenzer.net>
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpFdmVuIGlmIGds
YW1vcl9nYm1fYm9fZnJvbV9waXhtYXAgLyBnbGFtb3JfZmRfZnJvbV9waXhtYXAgdGhlbXNlbHZl
cwpkb24ndCB0cmlnZ2VyIGFueSBkcmF3aW5nLCB0aGVyZSBjb3VsZCBhbHJlYWR5IGJlIHVuZmx1
c2hlZCBkcmF3aW5nIHRvCnRoZSBwaXhtYXAgd2hvc2Ugc3RvcmFnZSB3ZSBzaGFyZSB3aXRoIGEg
Y2xpZW50LgoKKFBvcnRlZCBmcm9tIGFtZGdwdSBjb21taXQgNGIxNzUzM2ZjYjMwODQyY2FmMDAz
NWJhNTkzYjdkOTg2NTIwY2M4NSkKClNpZ25lZC1vZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNo
ZWwuZGFlbnplckBhbWQuY29tPgotLS0KIHNyYy9yYWRlb25fZHJpMy5jIHwgMjYgKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIxIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NyYy9yYWRlb25fZHJpMy5jIGIvc3JjL3JhZGVvbl9k
cmkzLmMKaW5kZXggNzMzNTNiZjUxLi5mOGY5MWM0YjQgMTAwNjQ0Ci0tLSBhL3NyYy9yYWRlb25f
ZHJpMy5jCisrKyBiL3NyYy9yYWRlb25fZHJpMy5jCkBAIC0yMjAsMjkgKzIyMCwxMyBAQCBzdGF0
aWMgaW50IHJhZGVvbl9kcmkzX2ZkX2Zyb21fcGl4bWFwKFNjcmVlblB0ciBzY3JlZW4sCiAJUkFE
RU9OSW5mb1B0ciBpbmZvID0gUkFERU9OUFRSKHNjcm4pOwogCiAJaWYgKGluZm8tPnVzZV9nbGFt
b3IpIHsKLQkJQm9vbCBuZWVkX2ZsdXNoID0gVFJVRTsKLQkJaW50IHJldCA9IC0xOwotI2lmIFhP
UkdfVkVSU0lPTl9DVVJSRU5UID49IFhPUkdfVkVSU0lPTl9OVU1FUklDKDEsMTksOTksOTA0LDAp
Ci0JCXN0cnVjdCBnYm1fYm8gKmdibV9ibyA9IGdsYW1vcl9nYm1fYm9fZnJvbV9waXhtYXAoc2Ny
ZWVuLCBwaXhtYXApOworCQlpbnQgcmV0ID0gZ2xhbW9yX2ZkX2Zyb21fcGl4bWFwKHNjcmVlbiwg
cGl4bWFwLCBzdHJpZGUsIHNpemUpOwogCi0JCWlmIChnYm1fYm8pIHsKLQkJCXJldCA9IGdibV9i
b19nZXRfZmQoZ2JtX2JvKTsKLQkJCWdibV9ib19kZXN0cm95KGdibV9ibyk7Ci0KLQkJCWlmIChy
ZXQgPj0gMCkKLQkJCQluZWVkX2ZsdXNoID0gRkFMU0U7Ci0JCX0KLSNlbmRpZgotCi0JCWlmIChy
ZXQgPCAwKQotCQkJcmV0ID0gZ2xhbW9yX2ZkX2Zyb21fcGl4bWFwKHNjcmVlbiwgcGl4bWFwLCBz
dHJpZGUsIHNpemUpOwotCi0JCS8qIGdsYW1vciBtaWdodCBoYXZlIG5lZWRlZCB0byByZWFsbG9j
YXRlIHRoZSBwaXhtYXAgc3RvcmFnZSBhbmQKLQkJICogY29weSB0aGUgcGl4bWFwIGNvbnRlbnRz
IHRvIHRoZSBuZXcgc3RvcmFnZS4gVGhlIGNvcHkKLQkJICogb3BlcmF0aW9uIG5lZWRzIHRvIGJl
IGZsdXNoZWQgdG8gdGhlIGtlcm5lbCBkcml2ZXIgYmVmb3JlIHRoZQotCQkgKiBjbGllbnQgc3Rh
cnRzIHVzaW5nIHRoZSBwaXhtYXAgc3RvcmFnZSBmb3IgZGlyZWN0IHJlbmRlcmluZy4KKwkJLyog
QW55IHBlbmRpbmcgZHJhd2luZyBvcGVyYXRpb25zIG5lZWQgdG8gYmUgZmx1c2hlZCB0byB0aGUK
KwkJICoga2VybmVsIGRyaXZlciBiZWZvcmUgdGhlIGNsaWVudCBzdGFydHMgdXNpbmcgdGhlIHBp
eG1hcAorCQkgKiBzdG9yYWdlIGZvciBkaXJlY3QgcmVuZGVyaW5nLgogCQkgKi8KLQkJaWYgKHJl
dCA+PSAwICYmIG5lZWRfZmx1c2gpCisJCWlmIChyZXQgPj0gMCkKIAkJCXJhZGVvbl9jc19mbHVz
aF9pbmRpcmVjdChzY3JuKTsKIAogCQlyZXR1cm4gcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
