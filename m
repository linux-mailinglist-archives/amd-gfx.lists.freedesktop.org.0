Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10472716
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6774C6E445;
	Wed, 24 Jul 2019 05:00:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B13C6E440
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:29 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r4so32803112qkm.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5NGx80/tPCbfjcxe1Vx+SynAcFq7goxK16lxZYh668=;
 b=pZSg4w7GS+fqXSal7ojYv+JXSacfkVTO1nLD7dwLqymliaXCZYEyDCukjBJMrjVKY9
 LHgQ5zahSyiIXRAncTQ+0WZOR3on7r374Rf1zKsHkCsBBTQnjxbXP6EPxhjPnf9Nw26j
 oIgshdLdiLxEj2UcrdB9WK54YAqM17KSQiZaJl0ODivX70JiLOI1pIDBew8U3flbTMmT
 FYEsJVMTeMrAyOreNF2qYomJDE2VLfEZIqc+CrBh/LRROwvo++yUPazrHF/ueJwJ/mF+
 Tgt5AoEZsYogOsLChZ/ui3PG6dHskxui+ZcsHgfSrULjJejciqF18vF+8Dbot9V6pVeD
 veyg==
X-Gm-Message-State: APjAAAV/7H9WDOja6LW4kfP8Kq5XMQwVljsnK/4RSpPcuSFT0neAetdt
 6mlfVd5C7d5tIkpZd4SMMJ3soJDD
X-Google-Smtp-Source: APXvYqyPqWyUp5eEtMGwBGvu/bAfcWITM+G2bA+qCQjLHKsabgGuTy/gDb4WXHtSxfXF446FLb9NIQ==
X-Received: by 2002:a37:6c8:: with SMTP id 191mr55369350qkg.102.1563944428512; 
 Tue, 23 Jul 2019 22:00:28 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/9] drm/amdgpu/powerplay/vega12: only use PrepareMp1ForUnload
 for mode1 reset
Date: Wed, 24 Jul 2019 00:00:11 -0500
Message-Id: <20190724050012.31398-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5NGx80/tPCbfjcxe1Vx+SynAcFq7goxK16lxZYh668=;
 b=dKGnhTxgu2MhIZqbzuYtZsVbt3MOU1KbkDivrj2VmDoxWkB+6NJxMvs3eTi7wHtIqO
 G/6fpQiGQkmRdRJVpM7qZv7IS8KvBu6Lf2nHo/AQFHyaBWcJDxuc4UUm65rKu4FIMaP7
 QAPffRREqGJc0Dz5AvezcU0KMStW//xDfc99Z3ZTgiLXpZhilinkP0ld3SC9vUh9n4go
 35o0SqZsF27Rvz96NiDXseXEFi1ntepCEcYfkys2gycWuWWQ1LV+90LppHfmyX7S+gS1
 tSn6DpR+bFtI19gMr8GoIWqSsAgbu12YK701P4bPHn31hlb8vs71rgVzzuGrHQVSOyaH
 634w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQncyBub3QgbmVlZGVkIGZvciBCQUNPLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMKaW5kZXggM2QzNTA0NDExYjYz
Li45MzljNTNhNTFmNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMl9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMl9od21nci5jCkBAIC0yNDYwLDYgKzI0NjAsNyBAQCBzdGF0aWMgaW50IHZl
Z2ExMl9kaXNhYmxlX2RwbV90YXNrcyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogc3RhdGljIGlu
dCB2ZWdhMTJfcG93ZXJfb2ZmX2FzaWMoc3RydWN0IHBwX2h3bWdyICpod21ncikKIHsKIAlzdHJ1
Y3QgdmVnYTEyX2h3bWdyICpkYXRhID0gKHN0cnVjdCB2ZWdhMTJfaHdtZ3IgKikoaHdtZ3ItPmJh
Y2tlbmQpOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7CiAJaW50
IHJlc3VsdDsKIAogCXJlc3VsdCA9IHZlZ2ExMl9kaXNhYmxlX2RwbV90YXNrcyhod21ncik7CkBA
IC0yNDY4LDEwICsyNDY5LDEzIEBAIHN0YXRpYyBpbnQgdmVnYTEyX3Bvd2VyX29mZl9hc2ljKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCQkpOwogCWRhdGEtPndhdGVyX21hcmtzX2JpdG1hcCAm
PSB+KFdhdGVyTWFya3NMb2FkZWQpOwogCi0JUFBfQVNTRVJUX1dJVEhfQ09ERSgocmVzdWx0ID0g
c211bV9zZW5kX21zZ190b19zbWMoaHdtZ3IsCi0JCQlQUFNNQ19NU0dfUHJlcGFyZU1wMUZvclVu
bG9hZCkpID09IDAsCi0JCQkiW1ByZXBhcmVNcDFGb3JVbmxvYWRdIEZhaWxlZCEiLAotCQkJcmV0
dXJuIHJlc3VsdCk7CisJaWYgKGFtZGdwdV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSA9PSBBTURf
UkVTRVRfTUVUSE9EX01PREUxKSB7CisJCVBQX0FTU0VSVF9XSVRIX0NPREUoKHJlc3VsdCA9CisJ
CQkJICAgICBzbXVtX3NlbmRfbXNnX3RvX3NtYyhod21nciwKKwkJCQkJCQkgIFBQU01DX01TR19Q
cmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwKKwkJCQkgICAgIltQcmVwYXJlTXAxRm9yVW5sb2Fk
XSBGYWlsZWQhIiwKKwkJCQkgICAgcmV0dXJuIHJlc3VsdCk7CisJfQogCiAJcmV0dXJuIHJlc3Vs
dDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
