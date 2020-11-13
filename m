Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A022B1D66
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 15:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6A76E5BB;
	Fri, 13 Nov 2020 14:28:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08486E4DD
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c9so8201744wml.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BXDPKXdRdueiwX/LiUMD6iJyASVIxZBD/garEIirGM=;
 b=brzqYYPJkw4pvefC6wQnPQA3Y6um+5RdpE0kqcXc8rWKOoh3kU8lFmA0iBxjIcgt00
 h4iU9zhdlP0z2tW1JX4ar2UoS2qeuZtG9qwEuJcfocBjGp1cudNK/Ek0NiHbnm47LD9L
 2K3Qpn/guN7e6yEew9UrNl6xP2g9fkryB13QzPj/hMBdym6w8zpGZtTqclPt8qV+E/Uf
 39UB1eN3IJD0X7z8smthTFYuEKmY4N/btLwe00Kqtf1Dmh3c+r6qrpMJlyUMvkXlhpaT
 F4IHPwYSN3v5J4jRWacrfkkh32cypL57qfFCSaYSqB1UHvJH0C8CHut+A0Om1rWcdKv0
 wrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BXDPKXdRdueiwX/LiUMD6iJyASVIxZBD/garEIirGM=;
 b=iS5WYJ7dwIbMpoGG/ELYW+aFa9KmK0lES9Vy07G4bScmTq75WCvdTZe87knYHs3gdo
 jfGyEl1iu5+tfAo95I+sEmxQloOiJdp3kR9vBn0Ud1KPWxD/X/BPfJ/UM8jY+QZX19h0
 9UhQCKAnIAjrLqh3YRZ6SxTRlucr2cpMVoIcVO04WTmSggI4qEnOp0htZkT8LfKIZ7dF
 FgvzpTx0OfmCCSHKLf8wQbPbATWvrf/Kx6IcMi+/9BnU6mwJgPIuxCBKeTK1WacPLZUr
 1NytoiCnNBCTCbT3oecXSYqVO800LQdWfA8tHrUbUwv/Pe0sgDYIBLeDXL5IXC0efbzp
 Tv7g==
X-Gm-Message-State: AOAM530AO3kxTj9170o5KGmam1QO5KRVOJS7KkxxSivhUtYwJgGxj0Yp
 KhX6NMJLBNvbRJMlZL/rTNsLLQ==
X-Google-Smtp-Source: ABdhPJyDbcqcylUfZcRfA5p5RtVVJCF+uRX3XcI+SeufaMml8mxZb1Csg+ASZWxQSwiKwPF6J8dG1A==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr2655258wmf.96.1605275412550; 
 Fri, 13 Nov 2020 05:50:12 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/40] drm/amd/amdgpu/amdgpu_debugfs: Demote obvious abuse of
 kernel-doc formatting
Date: Fri, 13 Nov 2020 13:49:23 +0000
Message-Id: <20201113134938.4004947-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Nov 2020 14:28:19 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYzozMDg6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2YnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9kZWJ1
Z2ZzX3JlZ3NfcmVhZCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2Zz
LmM6MzA4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdidWYnIG5vdCBk
ZXNjcmliZWQgaW4gJ2FtZGdwdV9kZWJ1Z2ZzX3JlZ3NfcmVhZCcKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmM6MzA4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdzaXplJyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfZGVidWdmc19yZWdz
X3JlYWQnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jOjMwODog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncG9zJyBub3QgZGVzY3JpYmVk
IGluICdhbWRncHVfZGVidWdmc19yZWdzX3JlYWQnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGVidWdmcy5jOjMxNzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnZicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2RlYnVnZnNfcmVnc193cml0ZScKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmM6MzE3OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdidWYnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdw
dV9kZWJ1Z2ZzX3JlZ3Nfd3JpdGUnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGVidWdmcy5jOjMxNzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc2l6
ZScgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2RlYnVnZnNfcmVnc193cml0ZScKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmM6MzE3OiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdwb3MnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9kZWJ1
Z2ZzX3JlZ3Nfd3JpdGUnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1t
LXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVn
ZnMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVi
dWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwppbmRl
eCA1YzFmMzcyNWM3NDEwLi5hNjY2N2EyY2EwZGIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAgLTMwMCw3ICszMDAsNyBAQCBzdGF0aWMgaW50ICBh
bWRncHVfZGVidWdmc19wcm9jZXNzX3JlZ19vcChib29sIHJlYWQsIHN0cnVjdCBmaWxlICpmLAog
CXJldHVybiByZXN1bHQ7CiB9CiAKLS8qKgorLyoKICAqIGFtZGdwdV9kZWJ1Z2ZzX3JlZ3NfcmVh
ZCAtIENhbGxiYWNrIGZvciByZWFkaW5nIE1NSU8gcmVnaXN0ZXJzCiAgKi8KIHN0YXRpYyBzc2l6
ZV90IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3NfcmVhZChzdHJ1Y3QgZmlsZSAqZiwgY2hhciBfX3VzZXIg
KmJ1ZiwKQEAgLTMwOSw3ICszMDksNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfZGVidWdmc19y
ZWdzX3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2VyICpidWYsCiAJcmV0dXJuIGFtZGdw
dV9kZWJ1Z2ZzX3Byb2Nlc3NfcmVnX29wKHRydWUsIGYsIGJ1Ziwgc2l6ZSwgcG9zKTsKIH0KIAot
LyoqCisvKgogICogYW1kZ3B1X2RlYnVnZnNfcmVnc193cml0ZSAtIENhbGxiYWNrIGZvciB3cml0
aW5nIE1NSU8gcmVnaXN0ZXJzCiAgKi8KIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3Jl
Z3Nfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyICpidWYsCi0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
