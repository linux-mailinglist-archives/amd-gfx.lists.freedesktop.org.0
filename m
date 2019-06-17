Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8D48EC5
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291289971;
	Mon, 17 Jun 2019 19:27:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C948997A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:55 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x47so12178415qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GM7X3SYEsEmSFTaoa94IocHR0vKkD+7xyuhUsxeiuu8=;
 b=deO76CYCyyYx+hep4wNe8MIe+kN1qBp0Wd2VjOq655LA28YogV27TEJnuOmQFJ+Jtq
 RwGMW2zSKzbZTyMFbDtF6Vg484Dipe/2q1kO6H8Yrg0oLm+t80dt/6qW17jpjcpHfJoy
 i0CjM5PiBz4UtewuAs40rdTBT4iQfWGCw3ISDIx0KvnlYX07cJiCVM/9Hsf10R9fdm+N
 wX31ERXpuPkVw8HXv6uZEWnUtMX15WVTAVagIJH8uQzMdL4Lfu1G7zFyME2PwCvIyX6I
 aNTOEPkl/GQa8CUj5MC/viet+hdisb5pR/W36yMBiHxX+fghM1WY/cIHn0xmwXt51FF9
 uhUQ==
X-Gm-Message-State: APjAAAVbMMqM9ZS+W7J8vi49VBpmiaQRDr4e2tYhqNS316/rxp9C3eU0
 Um7k7Ql9P5N4w3w/Jx/+jCXdDX6+rok=
X-Google-Smtp-Source: APXvYqx3EqNQwIbmysJ16Ny62l2+hfq41pV0rBXMUiEDgbJU8h+414gTTyjrXxpK0sArQ9LdnVX70Q==
X-Received: by 2002:a05:6214:3a5:: with SMTP id
 m5mr10462448qvy.7.1560799673961; 
 Mon, 17 Jun 2019 12:27:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 143/459] drm/amd/powerplay: fix the mp/smuio header for navi10
Date: Mon, 17 Jun 2019 14:26:08 -0500
Message-Id: <20190617192704.18038-44-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GM7X3SYEsEmSFTaoa94IocHR0vKkD+7xyuhUsxeiuu8=;
 b=grjLjBzClgACQ2cq/gBPKZQVz3HydlHrunR3wutoH4ZXRMBPAAHCfs75A0opg5k6ih
 2YI30KwIBRbLisQKD4YYk6Vd8y7KpHfshu0CRA0KJVSyUFtj0pTJ9S+pJgJHPkPjiC2I
 0H63MV7+qSQjbIrA2bT64H/xnLMP8L2S/AsKutV8w0dqkunZ1kVtghh7k5cIyyAh9EQ/
 TqKA87Edui92YRsUI1U2F4mBos7mGkPSLO2i8L85uxFSb7E9DDyk73HbrrR2V/1loePd
 D52LPm/r8rXILXNIfoVDB4Ywyv/uBFi3oRkbWDrVtJuJJqaic8Exd1mhS/dCHpJALGpl
 vzEA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClNNVTExIHNob3VsZCB1c2UgbXAx
MSBhbmQgc211aW8xMSBoZWFkZXJzLgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVh
bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgOCAr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDM3NmIxMGYw
YjJkOS4uMjY2NDQxNjhkNThjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djExXzAuYwpAQCAtMzUsMTEgKzM1LDExIEBACiAKICNpbmNsdWRlICJhc2ljX3JlZy90aG0vdGht
XzExXzBfMl9vZmZzZXQuaCIKICNpbmNsdWRlICJhc2ljX3JlZy90aG0vdGhtXzExXzBfMl9zaF9t
YXNrLmgiCi0jaW5jbHVkZSAiYXNpY19yZWcvbXAvbXBfOV8wX29mZnNldC5oIgotI2luY2x1ZGUg
ImFzaWNfcmVnL21wL21wXzlfMF9zaF9tYXNrLmgiCisjaW5jbHVkZSAiYXNpY19yZWcvbXAvbXBf
MTFfMF9vZmZzZXQuaCIKKyNpbmNsdWRlICJhc2ljX3JlZy9tcC9tcF8xMV8wX3NoX21hc2suaCIK
ICNpbmNsdWRlICJhc2ljX3JlZy9uYmlvL25iaW9fN180X29mZnNldC5oIgotI2luY2x1ZGUgImFz
aWNfcmVnL3NtdWlvL3NtdWlvXzlfMF9vZmZzZXQuaCIKLSNpbmNsdWRlICJhc2ljX3JlZy9zbXVp
by9zbXVpb185XzBfc2hfbWFzay5oIgorI2luY2x1ZGUgImFzaWNfcmVnL3NtdWlvL3NtdWlvXzEx
XzBfMF9vZmZzZXQuaCIKKyNpbmNsdWRlICJhc2ljX3JlZy9zbXVpby9zbXVpb18xMV8wXzBfc2hf
bWFzay5oIgogCiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMjBfc21jLmJpbiIpOwogCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
