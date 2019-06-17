Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F0F49084
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435836E084;
	Mon, 17 Jun 2019 19:50:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD66E07F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:49 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x18so6971552qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W3SIkEUFB9dLsZG/Jr5r39KiOdoyYn5068oJhIg5Ya8=;
 b=iX2vAeJNus1tzdU9KmX7QUByVA9d8/9wL/cHejkKRAnu6Guxz2powQwgZ0ijnMR9EN
 RXhJJjxarDhNV2Nu3wGMGla4UlB66jCN32Y9RBfCER1f6PbFNNUyT4AtCc0O8Bi0rX0B
 UaJf1WYEYR1xRPgsqxnmlGY4BR27KGXN/bcxDzE007/Eh1QrqlSkJ9oIMEqDZ3/muwUW
 k+DHRXrsFnUh1i16IrElIkl62yLWmPGasYaH6qD6OTjoKjgsoUFbLyG2n2kQ38cPhrRt
 1z12VJjvuuKtdIqyC+CNycSbULjP5cfBxcteIHpwK/JoPlBFYJPqUn8j+uNRHm8zwoy8
 Hq7Q==
X-Gm-Message-State: APjAAAUpSdYypE05X0U/OrXXnp/M0pN4k6Y8UH5fUSKVaV47MlcIokGi
 He9J3Ypg8rO8mIZ27U9XOxh5WJYhlOESNQ==
X-Google-Smtp-Source: APXvYqy62aE8aZukO6v28nBCAV5NFa72XPG5YwX6MwWB4imtJ80t+u7AY2UWI+CJluU06ST66nSh9A==
X-Received: by 2002:a05:620a:14ab:: with SMTP id
 x11mr24201176qkj.186.1560801048831; 
 Mon, 17 Jun 2019 12:50:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 452/459] drm/amd/display: add p010 and ayuv plane caps
Date: Mon, 17 Jun 2019 14:49:41 -0500
Message-Id: <20190617194948.18667-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W3SIkEUFB9dLsZG/Jr5r39KiOdoyYn5068oJhIg5Ya8=;
 b=KdJZC8qInSRlo12+zMTdB34/LycHfdjh19BiQavbzW7Un730SJ/W6XJNC+f99DpJPv
 98GX244pAF+bZbykyVONHHkf/wQMuBUefvFkvatRPtFw0L/KfTy0tnnN0+cu04W/ARoO
 xzoQ7+Tn2ax3b9VLHYS41ZHjorSRxzym1z9jf1lqv94UFnNBWelnQGgOdtTD0Yam77E3
 V/nfW2PKz9PkhkU2+aslkf+PGLnCnXpLGrGnXA1VzGmMyZQkFF/wGYIKvu45GWJI3CD7
 hZoY9uWqmejqq50uZGUIldXU7dZQWCZDQUGVvjUWksVEBqCswEt02RfKli3V4wrC5c05
 hpfw==
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCmZvciBmdXR1cmUgdXNl
CgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogQ2hyaXMgUGFyayA8Q2hyaXMuUGFya0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2Fu
cHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CkFja2VkLWJ5OiBLcnVub3Ns
YXYgS292YWMgPEtydW5vc2xhdi5Lb3ZhY0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAppbmRleCAyNTJlYmEyZWUxMTYuLjQ5OTU0
NDM1OWZhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTcwLDYgKzcwLDgg
QEAgc3RydWN0IGRjX3BsYW5lX2NhcCB7CiAJCXVpbnQzMl90IGFyZ2I4ODg4IDogMTsKIAkJdWlu
dDMyX3QgbnYxMiA6IDE7CiAJCXVpbnQzMl90IGZwMTYgOiAxOworCQl1aW50MzJfdCBwMDEwIDog
MTsKKwkJdWludDMyX3QgYXl1diA6IDE7CiAJfSBwaXhlbF9mb3JtYXRfc3VwcG9ydDsKIAkvLyBt
YXggdXBzY2FsaW5nIGZhY3RvciB4MTAwMAogCS8vIHVwc2NhbGluZyBmYWN0b3JzIGFyZSBhbHdh
eXMgPj0gMQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
