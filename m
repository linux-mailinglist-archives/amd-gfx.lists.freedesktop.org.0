Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C5A85D8
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5508925E;
	Wed,  4 Sep 2019 15:02:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E148925E
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:02:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id 30so10692205wrk.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Sep 2019 08:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGpojLk5xhk01mvtEBmpMgE9K/8oPqp46D0914CgHsU=;
 b=B66PWICFOoYCcBOqv11Z+hUgAuzc5QaPRth5QiQLL8lGEwXYE7It5Uze4HRMWcLA8L
 Hz/zYJ+zCYKyfovVgCndVsmISdVyKxnk2GIKqeM6hHjISQfahcx9VQVZ6xWxUmwm4qou
 oBUz9swfvgodrKtk5DJwVMCBEydHjmehLJk3AKAOsXzctmEYg332sNLSjOotcAjV78Vi
 Z5gwzhjppAWl0ZI0XfBIS5D2Arrwy7+84qur7AZBmCgs7hXi2Gu9j11p3lem7x6/Ph1i
 McYw3z4XHojzx0QhU2N7fyhXP6jaQYn63LMl3PnkaWpXoS5uBKuSn2oC368Hq+cCfRJr
 4Cqw==
X-Gm-Message-State: APjAAAWke3Yx0jNc/4PkB9sv1b1HZD815xmWqweBcwNw3XKmZnnHvsXF
 h2VnVLrhwqQ5t62+fCPZDgsM4n+Z
X-Google-Smtp-Source: APXvYqwxfNWvsEwSUCXGDC3tNHAKurOFiAdiHotbXQOkCmU5B8UnIvpYGg8imbFQfsniBr3VpTH69w==
X-Received: by 2002:a5d:6888:: with SMTP id h8mr14312042wru.68.1567609353271; 
 Wed, 04 Sep 2019 08:02:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6124:f264:ed7d:d416])
 by smtp.gmail.com with ESMTPSA id o9sm25928802wrj.17.2019.09.04.08.02.32
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 08:02:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: Graceful page fault handling for Vega/Navi
Date: Wed,  4 Sep 2019 17:02:21 +0200
Message-Id: <20190904150230.13885-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGpojLk5xhk01mvtEBmpMgE9K/8oPqp46D0914CgHsU=;
 b=loo/PO5wTxt+i3A1t7EtlG90820/MMPlKamVz/lpW4vOkxn42REJhA8EXN7r+RNef0
 8RHQiUswlvSqJsWDDHzG3hBPh9L//ObXJrio9v95TdMEYzH6zCnQFckSRXjghZZzthA1
 4DOcyw9mrgDusLpBa4Jg3MP8qwNmLDxVdcgCykpwVKTbRU5/tbBAiLr9Kehk4/Nhj31V
 4WoC2yhCCXJbyZcRiVqAKLA4xkwak8KfX8njQI/R3jRRI6cH87p2PMIxQmDqiqMt0wA9
 ZNtVw7jNP3CWTfZJBOGxnzpYbJeKl2ay0zaKePd5n53Pwk6YMXhauTPMsvXMIXAJneWW
 n20g==
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

SGkgZXZlcnlvbmUsCgp0aGlzIHNlcmllcyBpcyB0aGUgbmV4dCBwdXp6bGUgcGllY2UgZm9yIHJl
Y292ZXJhYmxlIHBhZ2UgZmF1bHQgaGFuZGxpbmcgb24gVmVnYSBhbmQgTmF2aS4KCkl0IGFkZHMg
YSBuZXcgZGlyZWN0IHNjaGVkdWxlciBlbnRpdHkgZm9yIFZNIHVwZGF0ZXMgd2hpY2ggaXMgdGhl
biB1c2VkIHRvIHVwZGF0ZSBwYWdlIHRhYmxlcyBkdXJpbmcgYSBmYXVsdC4KCkluIG90aGVyIHdv
cmRzIHByZXZpb3VzbHkgYW4gYXBwbGljYXRpb24gZG9pbmcgYW4gaW52YWxpZCBtZW1vcnkgYWNj
ZXNzIHdvdWxkIGp1c3QgaGFuZyBhbmQvb3IgcmVwZWF0IHRoZSBpbnZhbGlkIGFjY2VzcyBvdmVy
IGFuZCBvdmVyIGFnYWluLiBOb3cgdGhlIGhhbmRsaW5nIGlzIG1vZGlmaWVkIHNvIHRoYXQgdGhl
IGludmFsaWQgbWVtb3J5IGFjY2VzcyBpcyByZWRpcmVjdGVkIHRvIHRoZSBkdW1teSBwYWdlLgoK
VGhpcyBuZWVkcyB0aGUgZm9sbG93aW5nIHByZXJlcXVpc2l0ZXM6CmEpIFRoZSBmaXJtd2FyZSBt
dXN0IGJlIG5ldyBlbm91Z2ggc28gYWxsb3cgcmUtcm91dGluZyBvZiBwYWdlIGZhdWx0cy4KYikg
RmF1bHQgcmV0cnkgbXVzdCBiZSBlbmFibGVkIHVzaW5nIHRoZSBhbWRncHUubm9yZXRyeT0wIHBh
cmFtZXRlci4KYykgRW5vdWdoIGZyZWUgVlJBTSB0byBhbGxvY2F0ZSBwYWdlIHRhYmxlcyB0byBw
b2ludCB0byB0aGUgZHVtbXkgcGFnZS4KClRoZSByZS1yb3V0aW5nIG9mIHBhZ2UgZmF1bHRzIGN1
cnJlbnQgb25seSB3b3JrcyBvbiBWZWdhMTAsIHNvIFZlZ2EyMCBhbmQgTmF2aSB3aWxsIHN0aWxs
IG5lZWQgc29tZSBtb3JlIHRpbWUuCgpQbGVhc2UgcmV2aWV3IGFuZC9vciBjb21tZW50LApDaHJp
c3RpYW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
