Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F286B1D35
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Sep 2019 14:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA55B6F37C;
	Fri, 13 Sep 2019 12:18:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC76F37A
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Sep 2019 12:18:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u16so31906919wrr.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Sep 2019 05:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgadZtb7CZsN9h1r3CLwgkn3YTCgmw2Skq2cVO0The8=;
 b=rHLnOjD/4Bj+d4Jms+h/YF7d78NWq+j8FlTswlJvJyGewF9sMPfdSkiYBTm29fXM9H
 cUceDcz5rXStyiwKlbTjosQxWIwWvdsN5RIPcNTRdu/XpXIYdPLV40k2BFaz4efpQFaC
 xEv5PD7HipUoOPeRl1dA9V2YMxE9UOyHlaZ+zKIQmi6THBELe3M6Cx8w5C4IoG/CqKu8
 3VBpYS/QT2QSnZ+njJqLgt2R/wl3tpYCx2rMXrDNc2UmwiP9O3JQXDpekDn0wjr25GM2
 0QvyJ3dm/Kts9iNrgc3039z9wvN3ZO/6KvSlJ+v0Efgwylxc6aKQ0jAMjQvWkmmK1lve
 qEMw==
X-Gm-Message-State: APjAAAV44fCirQqR1wc79+M0Cr2bJvaQzrjwF0NjuhbKr3NPJFh4K66W
 H4RrQUX1D8vtKWYhYAlyDxrtlk9F
X-Google-Smtp-Source: APXvYqwG1zE8L3Be07iI1SzguxPZ5wEuoODi1ljfsYKz+Tfit6qnLNN4yC2xVNbef3RSZUcAimneOA==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr8091075wrw.345.1568377084089; 
 Fri, 13 Sep 2019 05:18:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fd97:b16a:b9f0:9362])
 by smtp.gmail.com with ESMTPSA id q15sm35882532wrg.65.2019.09.13.05.18.03
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 05:18:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: drop double HDP flush in the VM code
Date: Fri, 13 Sep 2019 14:18:00 +0200
Message-Id: <20190913121801.96728-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913121801.96728-1-christian.koenig@amd.com>
References: <20190913121801.96728-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YgadZtb7CZsN9h1r3CLwgkn3YTCgmw2Skq2cVO0The8=;
 b=j1Ttl67aWlRLMK1bewrmr3a/5wsEXOEG7Y7muPN+yCoOhcCu/WABmFFxNZkPeMDhvU
 SIGfYheXIyt7VMGD2Up2iNN7YpfJzTju0vQd6hT/zWfV50VVZawoSj6i7QJ8gNTQcegb
 0LGh0avqDSGhxOcyF7I/NwWw3JLCTgu/GiI+bvL3r2+lJcP7KL9DfV94HVf7YnxCUvoJ
 vu5/Fn31uUmgu2tFvB+A23qGr2UTt/NRv2DjhnkCPc9USPdN/K0LxsKtXEYstee9Ex9O
 MG4T/CBDDgIT7gZWd1dWpLGH9zn7nXAtzNaLg4A9OBuMG7Srmc6F9P+rR7dwxf2czzwb
 DzsA==
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

QWxyZWFkeSBkb25lIGluIHRoZSBDUFUgYmFzZWQgYmFja2VuZCBjb2RlLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgNiAtLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMK
aW5kZXggZWMyNmE2YjM3OGE5Li5mN2U1YjE5NTM5NjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jCkBAIC0xNzQxLDEyICsxNzQxLDYgQEAgaW50IGFtZGdwdV92bV9ib191
cGRhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfYm9fdmEgKmJv
X3ZhLAogCQkJcmV0dXJuIHI7CiAJfQogCi0JaWYgKHZtLT51c2VfY3B1X2Zvcl91cGRhdGUpIHsK
LQkJLyogRmx1c2ggSERQICovCi0JCW1iKCk7Ci0JCWFtZGdwdV9hc2ljX2ZsdXNoX2hkcChhZGV2
LCBOVUxMKTsKLQl9Ci0KIAkvKiBJZiB0aGUgQk8gaXMgbm90IGluIGl0cyBwcmVmZXJyZWQgbG9j
YXRpb24gYWRkIGl0IGJhY2sgdG8KIAkgKiB0aGUgZXZpY3RlZCBsaXN0IHNvIHRoYXQgaXQgZ2V0
cyB2YWxpZGF0ZWQgYWdhaW4gb24gdGhlCiAJICogbmV4dCBjb21tYW5kIHN1Ym1pc3Npb24uCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
