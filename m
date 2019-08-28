Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE1A0AE5
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032CF89F2A;
	Wed, 28 Aug 2019 19:57:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1AD89EF7
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:53 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k13so927828qtm.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZp5Pmzef+ljhq3E8EtCeEjXZ0W2OsIDm6X5Ka5mL1Y=;
 b=Vi/ykDcCvwr6CCbjsl+hekINm3gcyqQJmDQ+bFPpH/jl+1bxoZerw7eW+FtbP2mX+n
 kjJbvNr0w2H7Z1mXBy8udsr0XxnKO4w7+Ed9EGjnyG/2T0WHLFt/I7rY5nKZMWQe8Mru
 lpun/zAtKzHYJsEYp5UwBROlribenY1RWVvPg6lARsQbCYgQKDnm8dwLbqPfjnZaVrIX
 c5n0/Dy1KhpZSCTb+XQlqHJRXqahc9TMvvPzSLu7Cz1pSVPDN/dYj3juIwirEkd+o0na
 ja1qMQfO/jro6eChb1d8nIbsdcoHTSLJzDXlFhUfDGwPmZ4iOclUjHs2FESBOI5tBwIe
 Qzug==
X-Gm-Message-State: APjAAAUN1oM981bDuopPPA3pjAj6me1f4LOgyKAG+bKZyQYnDzNgUmL4
 1q0pd43NTEc10ey/gjq10W6f8tg0
X-Google-Smtp-Source: APXvYqxCy+UxvrKKn9ViSm8s68L36G6CeoAWgg+6YkyQ/FTJ5ypsR5hfh5mIGBB+ZcmlMIrLKcxVyg==
X-Received: by 2002:ac8:7046:: with SMTP id y6mr6279586qtm.131.1567022212429; 
 Wed, 28 Aug 2019 12:56:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/23] drm/amd/display: add Renoir to kconfig
Date: Wed, 28 Aug 2019 14:56:19 -0500
Message-Id: <20190828195622.28941-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZp5Pmzef+ljhq3E8EtCeEjXZ0W2OsIDm6X5Ka5mL1Y=;
 b=t5h9xCDa+Ccoqaq5+Kfqz6nSxiMylFBOp6pl8btIGpU0sl2M94aXJck0VgGCYMEthN
 exoggRdKKGc37ILfuHu8rskwiKVvJ3MXAlFPnEoW2CVyShOQ5SrxGJuNmYh+nzunCPmO
 Yg2svQ+dPJ3jIvOf7i7fs0JsBj1an/2VQ4AyqJN3iQS0ufspTe5xFgveanPzXBi0xFH2
 QDVvGi0PVgFzxd7hPgKjG7pdWNP4yjMtNlsshBqbnnz5R1hI7U+s0jH5RbdqgPoRClxo
 NUcDXp+kojtNZvfBVEpjiKoyoX2/w937dWO1Iqx68+jQ61unHZcxOkzL8kBZJkcXNE63
 eMtA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpBZGQg
YSBrY29uZmlnIG9wdGlvbiB0byBlbmFibGUgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTogQmhhd2Fu
cHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvS2NvbmZpZyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2Nv
bmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnCmluZGV4IDQ4Yzc0MjNl
OTJkYS4uODE1NGZkNjM3YWZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZwpAQCAt
MjUsNiArMjUsMTQgQEAgY29uZmlnIERSTV9BTURfRENfRENOMl8wCiAJICAgIENob29zZSB0aGlz
IG9wdGlvbiBpZiB5b3Ugd2FudCB0byBoYXZlCiAJICAgIE5hdmkgc3VwcG9ydCBmb3IgZGlzcGxh
eSBlbmdpbmUKIAorY29uZmlnIERSTV9BTURfRENfRENOMl8xCisgICAgICAgIGJvb2wgIkRDTiAy
LjEgZmFtaWx5IgorICAgICAgICBkZXBlbmRzIG9uIERSTV9BTURfREMgJiYgWDg2CisgICAgICAg
IGRlcGVuZHMgb24gRFJNX0FNRF9EQ19EQ04yXzAKKyAgICAgICAgaGVscAorICAgICAgICAgICAg
Q2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhhdmUKKyAgICAgICAgICAgIFJlbm9p
ciBzdXBwb3J0IGZvciBkaXNwbGF5IGVuZ2luZQorCiBjb25maWcgRFJNX0FNRF9EQ19EU0NfU1VQ
UE9SVAogCWJvb2wgIkRTQyBzdXBwb3J0IgogCWRlZmF1bHQgeQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
