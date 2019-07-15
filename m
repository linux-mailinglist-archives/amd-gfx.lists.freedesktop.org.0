Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600D469E46
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997526E02D;
	Mon, 15 Jul 2019 21:26:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8596A6E027
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:02 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r4so12815307qkm.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FcI7NvveRO/Ag86oBleCDiHsbANJK7hgrx/XzlcS87g=;
 b=t0YQ2Mm6odzJhCS4uLfVoofZyWDHltaD30rXi2D237c1j07VyKyg0BpDuUidYRw7Y+
 roGkLy66FksvNdusXJE4opkuwgxpsMaTOQI5BpKM8EUQIPilsxpGiZNaElFNALtAL0Yy
 slZxyqVtrT8b2219TgC/emrgapJXYg22RAXpM6RnSK+xfvAP9WLEXkVPe5YScwbVbOp2
 i1lpiBnBB7WmqDxshmQ5R0XEfWfaJJ5oZfZRhlUqgBJxivt/2HWLrQWJNNi+xwK9llRM
 aLWTRpzm7IHoLjKXNBUoUIqK2vHP43HODfDd+kf5y5Aap8Qbgu/N5JZzirKnGoY409+y
 ma1g==
X-Gm-Message-State: APjAAAVLscNULyygUaSCdAxZds6PPScEbtU3MtDVZvb0orfzE/+eJxG4
 3/X/rCp8oWrTycsSIJjk3miJhXcS
X-Google-Smtp-Source: APXvYqxxro3d40OobGMBSHSsaw8y/+7uIBmKvT2V4ddqFVeDnLv8xyLSRnPLAjcoLNCW4kYF1jPrLQ==
X-Received: by 2002:a37:c45:: with SMTP id 66mr18293238qkm.31.1563225961205;
 Mon, 15 Jul 2019 14:26:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 083/102] drm/amdgpu: assign fb_start/end in mmhub v9.4
 interface
Date: Mon, 15 Jul 2019 16:24:18 -0500
Message-Id: <20190715212437.31793-81-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FcI7NvveRO/Ag86oBleCDiHsbANJK7hgrx/XzlcS87g=;
 b=niAeA4/GURYC1ZOg2Cb/judxlMgm2WVNEpw8vp9ElxTSLeJW+mk3X+DZERQ2duCfKN
 3whtHMqVlKabf7hlhi1FZayl15OiwEFO2zAaDNveD0cN3D21Gj2/me/LJkfY3LmCSSRq
 NyN9cjUWrqTawz+fKJNQwNQRYzLs4LeTlAhZMwOYwNEhRNMJQJO2SGfzsqg0P0MIbyvQ
 7AMs2ZQIsD0Hix9ETJyfwY7thPZ4okYEX4qzzJNZ2ECRfsnA31lEyCTLpu5Oze2x4BIW
 Fuutc0a0PIQ9OH9/pvF25nb1p365xJYSzcNsZd40iEXq6vm9M7dewGr4Rv8XNmpFu9Zv
 HuQQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpBbGlnbiB3aXRoIG1taHViIHYxLjAuCgpTaWdu
ZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8
RmVpZmVpLlh1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
OV80LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMKaW5kZXggYzBlYjhmMGEyMTgyLi4zM2Iw
ZGU1NGE1ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5
XzQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMKQEAgLTM5
LDEwICszOSwxNyBAQCB1NjQgbW1odWJfdjlfNF9nZXRfZmJfbG9jYXRpb24oc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiB7CiAJLyogVGhlIGJhc2Ugc2hvdWxkIGJlIHNhbWUgYi90IDIgbW1o
dWJzIG9uIEFjcnR1cnVzLiBSZWFkIG9uZSBoZXJlLiAqLwogCXU2NCBiYXNlID0gUlJFRzMyX1NP
QzE1KE1NSFVCLCAwLCBtbVZNU0hBUkVEVkMwX01DX1ZNX0ZCX0xPQ0FUSU9OX0JBU0UpOworCXU2
NCB0b3AgPSBSUkVHMzJfU09DMTUoTU1IVUIsIDAsIG1tVk1TSEFSRURWQzBfTUNfVk1fRkJfTE9D
QVRJT05fVE9QKTsKIAogCWJhc2UgJj0gVk1TSEFSRURWQzBfTUNfVk1fRkJfTE9DQVRJT05fQkFT
RV9fRkJfQkFTRV9NQVNLOwogCWJhc2UgPDw9IDI0OwogCisJdG9wICY9IFZNU0hBUkVEVkMwX01D
X1ZNX0ZCX0xPQ0FUSU9OX1RPUF9fRkJfVE9QX01BU0s7CisJdG9wIDw8PSAyNDsKKworCWFkZXYt
PmdtYy5mYl9zdGFydCA9IGJhc2U7CisJYWRldi0+Z21jLmZiX2VuZCA9IHRvcDsKKwogCXJldHVy
biBiYXNlOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
