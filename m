Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85E69E01
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1948389DC0;
	Mon, 15 Jul 2019 21:25:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B633089DE1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:57 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id r21so12892077qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cft0qv5eAXOSVrqKCPIMG4nvro16IBSqpfzIt7kqVDU=;
 b=sXWSChZmPWnKehUznlmZvLcSr1aCUpEnWQ2r1ssEGPhxpOMAyWKLQ7niXZKCI8Owxh
 ZcZx3by/qYD1egujHVbEZt8Iw1WGo3BXrQYmCcgPHV/NmCexbU6HV/Jnw95avfNhE4ES
 YgGG4zOV0iA7uIz5eXa7A5dHz2G8xynp0MrD2XxalhXbP/2cuLlIxwokMM4sC/AnaKqy
 VfdGmybt16BHg5BzhyJ8V/yzvD8eVgkU2ryb73ktpEpoZdNd7j6Fxnarfvk83veH/65d
 MY+1MAN/pnIvArEyA14d4xqMglFqfafrilfPDfHEGUYe8v1F0bPF/yKdaEhOJM5Osb+h
 LoeA==
X-Gm-Message-State: APjAAAUce49Q8qpMlSblylOasmQAsn+q/rV5XMFxwxbDhSKXBieKQOTj
 v/wpcUYjYMY0hK9fy+KkHQRe8nVG
X-Google-Smtp-Source: APXvYqyTRMxehY5VucbIvD+38uSGqSWthnikKS05h0JoSxF+U9Wu5RRMLDqTC+IPL62kNh9UagPISg==
X-Received: by 2002:a37:9506:: with SMTP id x6mr18998959qkd.107.1563225896715; 
 Mon, 15 Jul 2019 14:24:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 013/102] drm/amdgpu: add SDMA 2~7 ip block type
Date: Mon, 15 Jul 2019 16:23:08 -0500
Message-Id: <20190715212437.31793-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cft0qv5eAXOSVrqKCPIMG4nvro16IBSqpfzIt7kqVDU=;
 b=Zv78EUmo49BV1W282sEiy0K5kX+QjUsRBjLUqq/0PYQp1LRuCqa/s3nhow5xXuyJdZ
 uhax/Na44oMA0nUZ90AQ3/fsNGuSJFBwkQpU/fXe1zaEdiif+hrGqKQGUbHWJYf+IK4p
 1Rs6HHTSSlHYRK4aCKk4uTDM9fnoQTDKAcp+PopwnaClEiP6fZxT4CeaFR1F1A2sHyFG
 J67tSG/FJInofmCNv/gHy9UodyngyJnAXMhpR8WgBmep5opf60A1HkBMLpvYzAb2W2zf
 vK2GLU6Ah8NhtYVau22r2UzKYjqpQ3RcngpWRkYe7VQlIuwkJ6AdaEmNkZ7pRFX9ROdH
 kwDA==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KQWNrZWQtYnk6IFNub3cgWmhhbmcgPCBTbm93LlpoYW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDYgKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRl
eCBhZWNiNGY3ZjljNDMuLmQ4ODE2NTdmYjg3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKQEAgLTcxNSw2ICs3MTUsMTIgQEAgZW51bSBhbWRfaHdfaXBfYmxvY2tfdHlwZSB7CiAJ
SERQX0hXSVAsCiAJU0RNQTBfSFdJUCwKIAlTRE1BMV9IV0lQLAorCVNETUEyX0hXSVAsCisJU0RN
QTNfSFdJUCwKKwlTRE1BNF9IV0lQLAorCVNETUE1X0hXSVAsCisJU0RNQTZfSFdJUCwKKwlTRE1B
N19IV0lQLAogCU1NSFVCX0hXSVAsCiAJQVRIVUJfSFdJUCwKIAlOQklPX0hXSVAsCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
