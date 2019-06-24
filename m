Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5451789
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228A489C99;
	Mon, 24 Jun 2019 15:45:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7867589B66
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id AC18D2A604A
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id aBwT1H9_dgJ2 for <amd-gfx@lists.freedesktop.org>;
 Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 33A352A6045
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hfR9z-0002Fr-H6
 for amd-gfx@lists.freedesktop.org; Mon, 24 Jun 2019 17:45:35 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH libdrm 0/2] amdgpu: Minor cleanups
Date: Mon, 24 Jun 2019 17:45:33 +0200
Message-Id: <20190624154535.8619-1-michel@daenzer.net>
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpJIHN0dW1ibGVk
IG92ZXIgdGhlc2Ugd2hpbGUgd29ya2luZyBvbiBiaWdnZXIgY2hhbmdlcy4KCk1pY2hlbCBEw6Ru
emVyICgyKToKICBhbWRncHU6IE1vdmUgdW5pb24gZGVjbGFyYXRpb24gdG8gdG9wIG9mCiAgICBh
bWRncHVfY3NfY3R4X292ZXJyaWRlX3ByaW9yaXR5CiAgYW1kZ3B1OiBVcGRhdGUgYW1kZ3B1X2Jv
X2hhbmRsZV90eXBlX2ttc19ub2ltcG9ydCBkb2N1bWVudGF0aW9uCgogYW1kZ3B1L2FtZGdwdS5o
ICAgIHwgNCArKy0tCiBhbWRncHUvYW1kZ3B1X2NzLmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
