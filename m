Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD551788
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEB989C96;
	Mon, 24 Jun 2019 15:45:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA79889B66
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3C41A2A6048
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:45:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id rImBTt5RH6Zf for <amd-gfx@lists.freedesktop.org>;
 Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 402602A6046
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hfR9z-0002Fv-JP
 for amd-gfx@lists.freedesktop.org; Mon, 24 Jun 2019 17:45:35 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH libdrm 2/2] amdgpu: Update amdgpu_bo_handle_type_kms_noimport
 documentation
Date: Mon, 24 Jun 2019 17:45:35 +0200
Message-Id: <20190624154535.8619-3-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624154535.8619-1-michel@daenzer.net>
References: <20190624154535.8619-1-michel@daenzer.net>
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpUbyByZWZsZWN0
IGN1cnJlbnQgcmVhbGl0eS4KClNpZ25lZC1vZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwu
ZGFlbnplckBhbWQuY29tPgotLS0KIGFtZGdwdS9hbWRncHUuaCB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hbWRn
cHUvYW1kZ3B1LmggYi9hbWRncHUvYW1kZ3B1LmgKaW5kZXggOWQ5YjA4MzIuLjY2ZTQ1ZjczIDEw
MDY0NAotLS0gYS9hbWRncHUvYW1kZ3B1LmgKKysrIGIvYW1kZ3B1L2FtZGdwdS5oCkBAIC04Nyw4
ICs4Nyw4IEBAIGVudW0gYW1kZ3B1X2JvX2hhbmRsZV90eXBlIHsKIAkvKiogRE1BLWJ1ZiBmZCBo
YW5kbGUgKi8KIAlhbWRncHVfYm9faGFuZGxlX3R5cGVfZG1hX2J1Zl9mZCA9IDIsCiAKLQkvKiog
S01TIGhhbmRsZSwgYnV0IHJlLWltcG9ydGluZyBhcyBhIERNQUJVRiBoYW5kbGUgdGhyb3VnaAot
CSAqICBkcm1QcmltZUhhbmRsZVRvRkQgaXMgZm9yYmlkZGVuLiAoR2xhbW9yIGRvZXMgdGhhdCkK
KwkvKiogRGVwcmVjYXRlZCBpbiBmYXZvdXIgb2YgYW5kIHNhbWUgYmVoYXZpb3VyIGFzCisJICog
YW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttcywgdXNlIHRoYXQgaW5zdGVhZCBvZiB0aGlzCiAJICov
CiAJYW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttc19ub2ltcG9ydCA9IDMsCiB9OwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
