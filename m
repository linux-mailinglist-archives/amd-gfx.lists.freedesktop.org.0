Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3AB407D
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DC26EA34;
	Mon, 16 Sep 2019 18:43:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971DD6EA32
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:43:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d2so1117870qtr.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 11:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikKpaMTWmgyLU6/m6IlehKiHDiwVjSj+Nar9s7pC8Io=;
 b=F/6HMQMYsEXtJedI+OQqLnunfCMFL3zIPmB5hv1yWW2DqRm5jZnMTy2Z7nygwITaLZ
 MHUbykJgiihoXYEGOgMEdQ4GD/JT1OLXt5Wq8z7e6N89LIwT2/ni2IUQWlqZE5bPX9pz
 JHGVDKbjpHTz3+ZVS4SynnYI2y3XKSNZOIDtugzMpa0Z72H8l0NtEFrkbG7BkYxDQ+73
 HXFC314KumEMalgpfGjYopHxGs3fCItVCO5pLkp1x60O/IxakklBI3DikzNkNoEAY1nN
 lXi0zoObIQoJ3AQG1gpTESVnIkEZ7LYFfY+oEKAsVVkgzsyqzVsXPBcMvP8b5tPNy6tT
 dGaw==
X-Gm-Message-State: APjAAAXzjmV/67ugR3nP9kuzwkcR+wEVeXPu64OBharnuyjNsO0B53Di
 wQpJSFfJ53U4NYW8lBOfRKCI+wxY
X-Google-Smtp-Source: APXvYqy0sQxJkUl/nq8rART57OKEY1s7xeQL/F4T4Ovd2JETCDdWMNm6ncLMdlrettPQJETGdYDxSw==
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr1151087qta.234.1568659402534; 
 Mon, 16 Sep 2019 11:43:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id n17sm20125714qke.103.2019.09.16.11.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 11:43:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: fix documentation for
 amdgpu_bo_create_kernel_at
Date: Mon, 16 Sep 2019 13:43:13 -0500
Message-Id: <20190916184313.20567-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916184313.20567-1-alexander.deucher@amd.com>
References: <20190916184313.20567-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikKpaMTWmgyLU6/m6IlehKiHDiwVjSj+Nar9s7pC8Io=;
 b=aFU4uFt+n7Ivl5cyFdgpG0MbsVmAayAF34/mtTiT5kj51tXDh1ycpEGCLIGqOOSPJ3
 1AgHFj3fe7HMH/EENVA+PsmNUNkqdytcaeg8gbnj7/8hYx63J4t09HXxSqa9i/7NjDte
 AWoIs5zYpMWrGIBgngeC9DCJqcKypGnNLRLOWhreUQ3Lf0L5p4C+MPPSGu/LmaFhtiBT
 eADnygRt3/GpZyePLNJBJNYzHkXKcwgX88GkwW3Eb41qnS0eYSWklGpumwVyyKuU080p
 HjZwBLO7MOsgRlOoHEMeVCxYEwAJ6PoHdWiEXQLF1xVupGiBrGQQSy3O96RApRGZMNUJ
 56yQ==
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

VHlwbyBpbiB0aGUgZnVuY3Rpb24gbmFtZS4KCkZpeGVzOiAwZDlhODAyMTM4MjkgKCJkcm0vYW1k
Z3B1OiBjbGVhbnVwIGNyZWF0aW5nIEJPcyBhdCBmaXhlZCBsb2NhdGlvbiIpClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmMKaW5kZXggNzBkNDVkNDg5MDdhLi5lY2FkODRlMWI0ZTIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKQEAgLTM0Myw3ICsz
NDMsNyBAQCBpbnQgYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiB9CiAKIC8qKgotICogYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwgLSBjcmVhdGUgQk8g
Zm9yIGtlcm5lbCB1c2UgYXQgc3BlY2lmaWMgbG9jYXRpb24KKyAqIGFtZGdwdV9ib19jcmVhdGVf
a2VybmVsX2F0IC0gY3JlYXRlIEJPIGZvciBrZXJuZWwgdXNlIGF0IHNwZWNpZmljIGxvY2F0aW9u
CiAgKgogICogQGFkZXY6IGFtZGdwdSBkZXZpY2Ugb2JqZWN0CiAgKiBAb2Zmc2V0OiBvZmZzZXQg
b2YgdGhlIEJPCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
