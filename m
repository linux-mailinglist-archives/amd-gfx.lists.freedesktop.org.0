Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE07A85DD
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FED898E1;
	Wed,  4 Sep 2019 15:02:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C3389872
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:02:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c3so21646611wrd.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Sep 2019 08:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bm/2JlXuX7dJYeZFcZnz9RPFHmDlFHHqMb5NMwlrk+E=;
 b=MOjiOpj4WeZw7FkhoeVPMeZekU1OiMeFqGD0+TTfIoCFGnVP22keXjNyhU5dbTi/T3
 b7C8usYdI32W9lAtpVgM/8tUsNA3LDUwwTXLG50iKLurnvo2BWTRqNPAObrqn2kOpHea
 PAqT+9ae4ShUuMlvWP8v7UI7SXDXUmFoMAcfTvGInHpO/7y0Md1UKA7q0JeCcZ9oQtng
 jh+EVKSleI4FOQPsfaP4/EnkDp+2d1bQ9+d8+mXzRaKpi5Matbc8oWJP05fAnSRuoFqW
 XhM/b1ElQjLefHWNnBh/bQmhoDpeJGBFq4mR0bDa/H0LOmQU1MLouRDlPavN966rP5M9
 hi1Q==
X-Gm-Message-State: APjAAAUIBXJH0UrzcnUIQBJfMG3JtkzX+2W8RNgTXRnbnTf/1CetnVSR
 /WF4GFm2s5qZab8nypt1vCeeSQ1t
X-Google-Smtp-Source: APXvYqymSXet8qso9HRRdjrnt9zGUVYuCg/3Kzt+e8LrjtEBWAeDsIryoCZI51kkDY4e1wX53fDg0Q==
X-Received: by 2002:adf:a350:: with SMTP id d16mr32039110wrb.326.1567609358145; 
 Wed, 04 Sep 2019 08:02:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6124:f264:ed7d:d416])
 by smtp.gmail.com with ESMTPSA id o9sm25928802wrj.17.2019.09.04.08.02.37
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 08:02:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/9] drm/amdgpu: allow direct submission of PTE updates
Date: Wed,  4 Sep 2019 17:02:26 +0200
Message-Id: <20190904150230.13885-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904150230.13885-1-christian.koenig@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bm/2JlXuX7dJYeZFcZnz9RPFHmDlFHHqMb5NMwlrk+E=;
 b=TZZ+mudB8r+4mV9CqhM4+eUQT7UzvYjmqCeQzy0mIzfP2Vrx8wf/velyuIpUmwH+w1
 3pICJX+4nnoXeS40p1H8Z6Aq/OliBAitloUBCBcKSp6GInRFEQdtZJGfPRoDfThA4oB3
 jSYfrrryIfgOfrDpO9FitZ7cAg1TNL9vBXUYD3x+J0ViiL91dFiMVwl1H6oJpMXUKp7B
 /ZVaSXEqQT88AULhG5hMpfg3IRKo8bkFDWDTRV3RIX1LwjCbu7nH5fihJoM+HxNtgmMT
 WLTU/JRuMaJ865WsXMIE8MM3MxWiBtUfuY2lsBk/joOFCjwJoLaOfKzP4o5264tVhAoR
 PN9g==
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

Rm9yIGhhbmRsaW5nIFBURSB1cGRhdGVzIGRpcmVjdGx5IGluIHRoZSBmYXVsdCBoYW5kbGVyLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMTggKysrKysr
KysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IGI2Yzg5YmE5
MjgxYy4uYzA5NjkwMzM3MGFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YwpAQCAtMTQ4NiwxMyArMTQ4NiwxNCBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV91cGRhdGVfcHRl
cyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywKICAqIGFtZGdwdV92bV9i
b191cGRhdGVfbWFwcGluZyAtIHVwZGF0ZSBhIG1hcHBpbmcgaW4gdGhlIHZtIHBhZ2UgdGFibGUK
ICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCi0gKiBAZXhjbHVzaXZlOiBmZW5j
ZSB3ZSBuZWVkIHRvIHN5bmMgdG8KLSAqIEBwYWdlc19hZGRyOiBETUEgYWRkcmVzc2VzIHRvIHVz
ZSBmb3IgbWFwcGluZwogICogQHZtOiByZXF1ZXN0ZWQgdm0KKyAqIEBkaXJlY3Q6IGRpcmVjdCBz
dWJtaXNzaW9uIGluIGEgcGFnZSBmYXVsdAorICogQGV4Y2x1c2l2ZTogZmVuY2Ugd2UgbmVlZCB0
byBzeW5jIHRvCiAgKiBAc3RhcnQ6IHN0YXJ0IG9mIG1hcHBlZCByYW5nZQogICogQGxhc3Q6IGxh
c3QgbWFwcGVkIGVudHJ5CiAgKiBAZmxhZ3M6IGZsYWdzIGZvciB0aGUgZW50cmllcwogICogQGFk
ZHI6IGFkZHIgdG8gc2V0IHRoZSBhcmVhIHRvCisgKiBAcGFnZXNfYWRkcjogRE1BIGFkZHJlc3Nl
cyB0byB1c2UgZm9yIG1hcHBpbmcKICAqIEBmZW5jZTogb3B0aW9uYWwgcmVzdWx0aW5nIGZlbmNl
CiAgKgogICogRmlsbCBpbiB0aGUgcGFnZSB0YWJsZSBlbnRyaWVzIGJldHdlZW4gQHN0YXJ0IGFu
ZCBAbGFzdC4KQEAgLTE1MDEsMTEgKzE1MDIsMTEgQEAgc3RhdGljIGludCBhbWRncHVfdm1fdXBk
YXRlX3B0ZXMoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwYXJhbXMsCiAgKiAwIGZv
ciBzdWNjZXNzLCAtRUlOVkFMIGZvciBmYWlsdXJlLgogICovCiBzdGF0aWMgaW50IGFtZGdwdV92
bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkgICAg
ICAgc3RydWN0IGFtZGdwdV92bSAqdm0sIGJvb2wgZGlyZWN0LAogCQkJCSAgICAgICBzdHJ1Y3Qg
ZG1hX2ZlbmNlICpleGNsdXNpdmUsCi0JCQkJICAgICAgIGRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIs
Ci0JCQkJICAgICAgIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogCQkJCSAgICAgICB1aW50NjRfdCBz
dGFydCwgdWludDY0X3QgbGFzdCwKIAkJCQkgICAgICAgdWludDY0X3QgZmxhZ3MsIHVpbnQ2NF90
IGFkZHIsCisJCQkJICAgICAgIGRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIsCiAJCQkJICAgICAgIHN0
cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJh
bXMgcGFyYW1zOwpAQCAtMTUxNSw2ICsxNTE2LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9f
dXBkYXRlX21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJbWVtc2V0KCZwYXJh
bXMsIDAsIHNpemVvZihwYXJhbXMpKTsKIAlwYXJhbXMuYWRldiA9IGFkZXY7CiAJcGFyYW1zLnZt
ID0gdm07CisJcGFyYW1zLmRpcmVjdCA9IGRpcmVjdDsKIAlwYXJhbXMucGFnZXNfYWRkciA9IHBh
Z2VzX2FkZHI7CiAKIAkvKiBzeW5jIHRvIGV2ZXJ5dGhpbmcgZXhjZXB0IGV2aWN0aW9uIGZlbmNl
cyBvbiB1bm1hcHBpbmcgKi8KQEAgLTE2NTAsOSArMTY1Miw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZtX2JvX3NwbGl0X21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCX0KIAog
CQlsYXN0ID0gbWluKCh1aW50NjRfdCltYXBwaW5nLT5sYXN0LCBzdGFydCArIG1heF9lbnRyaWVz
IC0gMSk7Ci0JCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwgZXhjbHVzaXZl
LCBkbWFfYWRkciwgdm0sCisJCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwg
dm0sIGZhbHNlLCBleGNsdXNpdmUsCiAJCQkJCQlzdGFydCwgbGFzdCwgZmxhZ3MsIGFkZHIsCi0J
CQkJCQlmZW5jZSk7CisJCQkJCQlkbWFfYWRkciwgZmVuY2UpOwogCQlpZiAocikKIAkJCXJldHVy
biByOwogCkBAIC0xOTQ2LDkgKzE5NDgsOSBAQCBpbnQgYW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkgICAgbWFwcGluZy0+c3RhcnQgPCBBTURHUFVf
R01DX0hPTEVfU1RBUlQpCiAJCQlpbml0X3B0ZV92YWx1ZSA9IEFNREdQVV9QVEVfREVGQVVMVF9B
VEM7CiAKLQkJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCBOVUxMLCBOVUxM
LCB2bSwKKwkJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwgZmFsc2Us
IE5VTEwsCiAJCQkJCQltYXBwaW5nLT5zdGFydCwgbWFwcGluZy0+bGFzdCwKLQkJCQkJCWluaXRf
cHRlX3ZhbHVlLCAwLCAmZik7CisJCQkJCQlpbml0X3B0ZV92YWx1ZSwgMCwgTlVMTCwgJmYpOwog
CQlhbWRncHVfdm1fZnJlZV9tYXBwaW5nKGFkZXYsIHZtLCBtYXBwaW5nLCBmKTsKIAkJaWYgKHIp
IHsKIAkJCWRtYV9mZW5jZV9wdXQoZik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
