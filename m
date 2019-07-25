Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16E754CE
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E9B6E7B2;
	Thu, 25 Jul 2019 16:58:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C416E7AB
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:13 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id t8so36970549qkt.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSw9zmexFIgocIwacD52iq+zC669IKKwf4x7r6z5dtM=;
 b=P1D2QqoKX/lN3nLV/Aoqy07butKGxbxBH9PEzpUFOK8+XM3kity+s5+03B0hxOOsUK
 UJFf4UCAoW68uGRllJmYl7jfekJbWmRLcy6A+G7hqgCjbVXBfnDF/WwfYrQ3MMUb40dy
 3aB6kHCzTCab946UtSI67d0fgSnCL/nK4uvD4uFNnFLfd1+Pl6H/qPjBfeOSvNvCRkXi
 iqc477PCM0qmCmp4Sk8rjAIa9dELiVBVJTHJmgyOaB+K8WBCrvujebbABHMVnXY8UMju
 lKBc2HaEw4YBmnbqBIv+Uqo8YBtoaCUUtsxnYYlp70bnjohrQNCq+MXyjVPs3/qTJgUC
 wwaA==
X-Gm-Message-State: APjAAAXUrmS0f/2dbaQ2so67SvnOq5IehMKYS6v5umjlZH3uo0T045ex
 rQ4DMvfKF52Ze1W5/BC9k+HYYk+q
X-Google-Smtp-Source: APXvYqxxSVdEZ9P9ARkFG4ifU+Bbal7wXmzIXUjJAC/33S6QGpikzWzrBZRrVSj6/aiFxmwAFK+vKg==
X-Received: by 2002:a05:620a:232:: with SMTP id
 u18mr57310276qkm.131.1564073892743; 
 Thu, 25 Jul 2019 09:58:12 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/12] drm/amdgpu/powerplay: add set_mp1_state for vega12
Date: Thu, 25 Jul 2019 11:57:56 -0500
Message-Id: <20190725165758.16928-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSw9zmexFIgocIwacD52iq+zC669IKKwf4x7r6z5dtM=;
 b=ADBkykh9548l0+I4J3Y53e2HzsHXPJmHL+3igkZN8+A3gyDNvG2kc2Pi7Wwi7REEx1
 zcpJfvxLBnhza1lpf8gs3HiU6waHRu0h0Y3sLrY5OEUEQ1q686oM6gSJXsOcAlm1do5q
 Gw9lfoQRAh1AvemY7P1O3Y9hKGegQrJkXK2kDbwZKtd2I1JJFVScJAa9DSpISpz/uFsX
 RvF6N2t+6xZUp8beJ9B+ez1FNnjvLZI6nqJQWn+InSuOhJcMGUYWTq8pG+/E33mRbXBk
 S/Np0u9MH3oz2M0g4lNARJ3zhB8TBm/h+1cqjVIFbZ8zo6XgJTDhkitpFxfqMBEpO6Fi
 3pSQ==
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

VGhpcyBzZXRzIHRoZSBTTVUgaW50byB0aGUgcHJvcGVyIHN0YXRlIGZvciB2YXJpb3VzCm9wZXJh
dGlvbnMgKHNodXRkb3duLCB1bmxvYWQsIEdQVSByZXNldCwgZXRjLikuCgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jICAgIHwgMjYgKysrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdt
Z3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5j
CmluZGV4IGVmYjZkMzc2MmZlYi4uN2FmOWFkNDUwYWM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwpAQCAtMjYzOSw2ICsyNjM5
LDMwIEBAIHN0YXRpYyBpbnQgdmVnYTEyX2dldF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyLCBjb25zdCBzdHJ1Y3QgcHBfCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBp
bnQgdmVnYTEyX3NldF9tcDFfc3RhdGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKKwkJCQllbnVt
IHBwX21wMV9zdGF0ZSBtcDFfc3RhdGUpCit7CisJdWludDE2X3QgbXNnOworCWludCByZXQ7CisK
Kwlzd2l0Y2ggKG1wMV9zdGF0ZSkgeworCWNhc2UgUFBfTVAxX1NUQVRFX1VOTE9BRDoKKwkJbXNn
ID0gUFBTTUNfTVNHX1ByZXBhcmVNcDFGb3JVbmxvYWQ7CisJCWJyZWFrOworCWNhc2UgUFBfTVAx
X1NUQVRFX1NIVVRET1dOOgorCWNhc2UgUFBfTVAxX1NUQVRFX1JFU0VUOgorCWNhc2UgUFBfTVAx
X1NUQVRFX05PTkU6CisJZGVmYXVsdDoKKwkJcmV0dXJuIDA7CisJfQorCisJUFBfQVNTRVJUX1dJ
VEhfQ09ERSgocmV0ID0gc211bV9zZW5kX21zZ190b19zbWMoaHdtZ3IsIG1zZykpID09IDAsCisJ
CQkgICAgIltQcmVwYXJlTXAxXSBGYWlsZWQhIiwKKwkJCSAgICByZXR1cm4gcmV0KTsKKworCXJl
dHVybiAwOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwX2h3bWdyX2Z1bmMgdmVnYTEyX2h3
bWdyX2Z1bmNzID0gewogCS5iYWNrZW5kX2luaXQgPSB2ZWdhMTJfaHdtZ3JfYmFja2VuZF9pbml0
LAogCS5iYWNrZW5kX2ZpbmkgPSB2ZWdhMTJfaHdtZ3JfYmFja2VuZF9maW5pLApAQCAtMjY5NSw3
ICsyNzE5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcF9od21ncl9mdW5jIHZlZ2ExMl9od21n
cl9mdW5jcyA9IHsKIAkuc2V0X2FzaWNfYmFjb19zdGF0ZSA9IHZlZ2ExMl9iYWNvX3NldF9zdGF0
ZSwKIAkuZ2V0X3BwZmVhdHVyZV9zdGF0dXMgPSB2ZWdhMTJfZ2V0X3BwZmVhdHVyZV9zdGF0dXMs
CiAJLnNldF9wcGZlYXR1cmVfc3RhdHVzID0gdmVnYTEyX3NldF9wcGZlYXR1cmVfc3RhdHVzLAot
CisJLnNldF9tcDFfc3RhdGUgPSB2ZWdhMTJfc2V0X21wMV9zdGF0ZSwKIH07CiAKIGludCB2ZWdh
MTJfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
