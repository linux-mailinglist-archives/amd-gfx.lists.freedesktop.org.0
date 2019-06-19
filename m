Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945164B842
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 14:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F8A6E397;
	Wed, 19 Jun 2019 12:29:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98D36E395
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 12:29:19 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Computer111.attlocal.net ([99.116.190.167]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MdNY8-1iCuSp2FHs-00ZQQA; Wed, 19 Jun 2019 14:29:15 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu: Rename plane_type parameter of
 initialize_plane() to type
Date: Wed, 19 Jun 2019 07:28:55 -0500
Message-Id: <20190619122857.12603-3-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619122857.12603-1-kevinbrace@gmx.com>
References: <20190619122857.12603-1-kevinbrace@gmx.com>
X-Provags-ID: V03:K1:JWUUtzvcsNK1aLb6XACB7SzF2tuQWdJQByKNJ/4SCE/pLWdjwqa
 KLlFkyQsJnL/mDvz6DJ+tfnoLz58ocllmZcPMr0lKimVVAYPWVmRGYiF1+zaa1HjLOrKrkD
 fv4LvzuQlNOVpBO0Y3EinRUBy5h+BKf0GPAJ0LKxLkXwS0pGKOyUerfgvNX9vi5xIq+qeob
 GyLtkCpE8Qcdhi9mIqvxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iRLvkNWIM+w=:2nXFFdVCTQ/+BvTJ09Y7pa
 JYuVJvYss7yYM0b0E6kR+9PJ+P/tagqu966bEZbvqc73rSUnqkRh05JjzijJsCHQ9W8mbqB21
 idoyEGyHBLNujYaPSsiG4MovBUfbJS7UrGnrzhCRZndTiIhWYYaqIBegjTpGHH1aQMZOqgyQ4
 LFjaS82iB4g4ol9k26M1CJj/qYPeEspXvKHxictvQdxtRTLKgEtOkzWFwCK/bL8jIqy2DOm8I
 NDqc98F3zk6hLCHai8CTWy1Jc9HCTh5mGQpcgz1hIpXxtVdFJzaenhqh37CdUQ9rvEIgvLBQ2
 JsTriDzaGQvewHfPEcLhPMoVNZYNH/vIODxKBemluCaYKVO9Gxd6PugC7fXqpye51VHmOHLeK
 tBmTXw0DnyKura5WK4f7HoQ24/kQLDT1t5SwcUcv8R6wYIuhKcsI26sWkmEU8mkErFZ2cLF22
 BcECZD5dmbtiti6kmZzDpumRuhtf4UMHfZW7QhdGb4PdiNz3GefqkXLz3oPam8wPwzKoFZlYl
 qi9YXSXOyeb3WISysf4P4MHuQ4ZNxvRkbA5yutTYqLCKYgMiNUZzYzQ6MO04n9jaQdj2yjn4C
 qN55ig4sSP/akncL2+TeldhITp8BM4C4KrlQ7d7bKaQoh9X3EoJqqnL8S2nd2r+v1M0nqpd4w
 tR2AwimDpBMUfDcjDrDLxGIvRNdX7RNlL2nehhDOul4go57pbRMEcwmC0WALN9yLiM7FGlQxp
 6L6Z1qVyagiEKc37rB57VoXWp5JJff/Ifur63fnyOGihUcFYM2VHsjh480lVhopA+mSWirzkH
 CZmYTIL3ADUj0iF6JhzYiXkgmr5WoU6A9evzgiGFhjcjjZ7FelXIplauxp8LtRFf76XiUP3lZ
 cnTzvqWGLdn0+knBvp83Cs8xCUM2BycWDFTkyXBtW37LnbX91fIAf0EStjtfX5utzmIrkLUva
 vY25EirTpf/wFnZAokSB5U4lX4U8sQzo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1560947356;
 bh=awV1EI1oSBbLYFF6SbREf93BFJrY4eu2FwlngVOylkg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LLA8yWK2jKy5GpImZTaL1IGQ4lLJTwvarmqYRrw26mFIUCDwCr+XcYQUwjlltb0dr
 xxO1nC2MyA6ZFSB4qPNzNb555vNNPFrUsTr+7T+rvECgoP4rJgsAPsvjiCNzWPm1JM
 mZ0oDgt8YKP/mSUaBluEjm3RdkBl2twiTGLs9JnA=
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+CgpNYXRj
aGluZyB0aGUgdHlwZSBwYXJhbWV0ZXIgb2YgZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0KCkuCgpT
aWduZWQtb2ZmLWJ5OiBLZXZpbiBCcmFjZSA8a2V2aW5icmFjZUBicmFjZWNvbXB1dGVybGFiLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCmluZGV4IDdhNTRhOTYyM2I4Zi4uZmJkMmIzNDQwN2Q1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTE5ODUsNyArMTk4
NSw3IEBAIGFtZGdwdV9kbV9yZWdpc3Rlcl9iYWNrbGlnaHRfZGV2aWNlKHN0cnVjdCBhbWRncHVf
ZGlzcGxheV9tYW5hZ2VyICpkbSkKCiBzdGF0aWMgaW50IGluaXRpYWxpemVfcGxhbmUoc3RydWN0
IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQkJICAgIHN0cnVjdCBhbWRncHVfbW9kZV9p
bmZvICptb2RlX2luZm8sIGludCBwbGFuZV9pZCwKLQkJCSAgICBlbnVtIGRybV9wbGFuZV90eXBl
IHBsYW5lX3R5cGUsCisJCQkgICAgZW51bSBkcm1fcGxhbmVfdHlwZSB0eXBlLAogCQkJICAgIGNv
bnN0IHN0cnVjdCBkY19wbGFuZV9jYXAgKnBsYW5lX2NhcCkKIHsKIAlzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZTsKQEAgLTE5OTcsNyArMTk5Nyw3IEBAIHN0YXRpYyBpbnQgaW5pdGlhbGl6ZV9wbGFu
ZShzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCURSTV9FUlJPUigiS01TOiBG
YWlsZWQgdG8gYWxsb2NhdGUgcGxhbmVcbiIpOwogCQlyZXR1cm4gLUVOT01FTTsKIAl9Ci0JcGxh
bmUtPnR5cGUgPSBwbGFuZV90eXBlOworCXBsYW5lLT50eXBlID0gdHlwZTsKCiAJLyoKIAkgKiBI
QUNLOiBJR1QgdGVzdHMgZXhwZWN0IHRoYXQgdGhlIHByaW1hcnkgcGxhbmUgZm9yIGEgQ1JUQwot
LQoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
