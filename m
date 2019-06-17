Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD648E87
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7068980C;
	Mon, 17 Jun 2019 19:27:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDDC897FD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:16 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t8so6965259qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qOxnVcfPN4qrQx6AXzBEROVSc4dJQg2HPVXKsLIyMak=;
 b=Ri0lDRQQGEK43zz3OfkrS2+NMbSruUgbOPESgqXQIcpnsob3c02JiGA7Pty/NlUmi6
 wEtcCSa2GRz7wz8A8aYjfG8XO6PnnzcpnGRl0m4qp4Vx8BuiLLfMmFttTQDRNZXF13HK
 K/KD9nPYMvUY+eV1Ms9Ssscx7NhajNMvH0M6IyBiI8iGtolbbc34zvWuf8S5dXttYBV7
 aEfVvYA/307gu+MGqu3cqaQso87N0v9OjBbzMepuLkiFojfzyabXDc2lXMwIV7vmZKkh
 WQdre9NrA8Xhd/HPviTncYQ9v1aPoteaoHtY+04IA7Xg+80uZVzr1lj1+lASrOPEWqsQ
 eDQw==
X-Gm-Message-State: APjAAAW3Q8qlsN7J7B983VPXnZgJBGD1b/xA8oR9LzaVMikctMpUjaKE
 XxalEc7rpFS8V5ZZWFJp9/mymaEIZJk=
X-Google-Smtp-Source: APXvYqziSsqsJzEZ8VyDxfppSgkkD1ilPu647R3ggS8MQHxCgq8phvAPKADyK52clI99aH7Ki8nn8w==
X-Received: by 2002:a37:b904:: with SMTP id j4mr63601415qkf.27.1560799635462; 
 Mon, 17 Jun 2019 12:27:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 103/459] drm/amdgpu/discovery: stop taking psp header into
 account
Date: Mon, 17 Jun 2019 14:25:28 -0500
Message-Id: <20190617192704.18038-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOxnVcfPN4qrQx6AXzBEROVSc4dJQg2HPVXKsLIyMak=;
 b=McgPhHREzU2T16DfrYOht9xzs8fsUOb1KG0Hg1UJmrr124s3vVQMCc2QWmlXBoxQFX
 7fWQk+xi1pmdzs5Bmu78tIx4cj3hVZZ9W3TnK78AEKB8UA2n+EJUwKcdDiOZfwLdIjDb
 UXVbLa/Zk26dcmAH4cnenYLKc3/PGXnKWHG+lB3JROY4hcDCFVrBPNF1BqSHCbIA0I3z
 5HRKCAa21V5yKqBpA9yVXAtGcEAeLk+nIyF/S2dElB4aSA55NmCBU80XOlXTuAt8K/tT
 avbqqCTMDpJeUtSCeULp/26+wDq6Rf0tyGFZdDnBv04eSQsXUxCwKE3hnGc1lqpwr+c0
 EHCQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnBzcCB3aWxsIHdyaXRl
IGEgaGVhZGVyIHRvIHZyYW0sIGJ1dCB0aGUgdmFsdWUgZXhwb3NlZCBpbgpSQ0NfQ09ORklHX01F
TVNJWkUgZG9lcyBub3QgaW5jbHVkZSB0aGUgbWVtb3J5IHRoYXQgdGhpcyBoZWFkZXIgaXMKd3Jp
dHRlbiB0by4gVGhlcmVmb3JlLCB0aGUgaW50ZXJwcmV0YXRpb24gb2YgdGhlIHRhYmxlIGRvZXMg
bm90IG5lZWQgdG8KdGFrZSB0aGUgcHNwIGhlYWRlciBpbnRvIGFjY291bnQuCgpTaWduZWQtb2Zm
LWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3
a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIHwgMTEgKysrKystLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCmluZGV4IGVjMTRmZDEzNTBlMi4uNWY5Njdh
ZThkNGVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlz
Y292ZXJ5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVy
eS5jCkBAIC0xODksNyArMTg5LDcgQEAgaW50IGFtZGdwdV9kaXNjb3ZlcnlfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAkJZ290byBvdXQ7CiAJfQogCi0JYmhkciA9IChzdHJ1Y3Qg
YmluYXJ5X2hlYWRlciAqKShhZGV2LT5kaXNjb3ZlcnkgKyBQU1BfSEVBREVSX1NJWkUpOworCWJo
ZHIgPSAoc3RydWN0IGJpbmFyeV9oZWFkZXIgKilhZGV2LT5kaXNjb3Zlcnk7CiAKIAlpZiAobGUz
Ml90b19jcHUoYmhkci0+YmluYXJ5X3NpZ25hdHVyZSkgIT0gQklOQVJZX1NJR05BVFVSRSkgewog
CQlEUk1fRVJST1IoImludmFsaWQgaXAgZGlzY292ZXJ5IGJpbmFyeSBzaWduYXR1cmVcbiIpOwpA
QCAtMTk3LDggKzE5Nyw3IEBAIGludCBhbWRncHVfZGlzY292ZXJ5X2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJCWdvdG8gb3V0OwogCX0KIAotCW9mZnNldCA9IFBTUF9IRUFERVJf
U0laRSArCi0JCW9mZnNldG9mKHN0cnVjdCBiaW5hcnlfaGVhZGVyLCBiaW5hcnlfY2hlY2tzdW0p
ICsKKwlvZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgYmluYXJ5X2hlYWRlciwgYmluYXJ5X2NoZWNr
c3VtKSArCiAJCXNpemVvZihiaGRyLT5iaW5hcnlfY2hlY2tzdW0pOwogCXNpemUgPSBiaGRyLT5i
aW5hcnlfc2l6ZSAtIG9mZnNldDsKIAljaGVja3N1bSA9IGJoZHItPmJpbmFyeV9jaGVja3N1bTsK
QEAgLTI3NSw3ICsyNzQsNyBAQCBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9yZWdfYmFzZV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQliaGRy
ID0gKHN0cnVjdCBiaW5hcnlfaGVhZGVyICopKGFkZXYtPmRpc2NvdmVyeSArIFBTUF9IRUFERVJf
U0laRSk7CisJYmhkciA9IChzdHJ1Y3QgYmluYXJ5X2hlYWRlciAqKWFkZXYtPmRpc2NvdmVyeTsK
IAlpaGRyID0gKHN0cnVjdCBpcF9kaXNjb3ZlcnlfaGVhZGVyICopKGFkZXYtPmRpc2NvdmVyeSAr
CiAJCQlsZTE2X3RvX2NwdShiaGRyLT50YWJsZV9saXN0W0lQX0RJU0NPVkVSWV0ub2Zmc2V0KSk7
CiAJbnVtX2RpZXMgPSBsZTE2X3RvX2NwdShpaGRyLT5udW1fZGllcyk7CkBAIC0zMzgsNyArMzM3
LDcgQEAgaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2lwX3ZlcnNpb24oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIGludCBod19pZCwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JYmhkciA9
IChzdHJ1Y3QgYmluYXJ5X2hlYWRlciAqKShhZGV2LT5kaXNjb3ZlcnkgKyBQU1BfSEVBREVSX1NJ
WkUpOworCWJoZHIgPSAoc3RydWN0IGJpbmFyeV9oZWFkZXIgKilhZGV2LT5kaXNjb3Zlcnk7CiAJ
aWhkciA9IChzdHJ1Y3QgaXBfZGlzY292ZXJ5X2hlYWRlciAqKShhZGV2LT5kaXNjb3ZlcnkgKwog
CQkJbGUxNl90b19jcHUoYmhkci0+dGFibGVfbGlzdFtJUF9ESVNDT1ZFUlldLm9mZnNldCkpOwog
CW51bV9kaWVzID0gbGUxNl90b19jcHUoaWhkci0+bnVtX2RpZXMpOwpAQCAtMzc2LDcgKzM3NSw3
IEBAIGludCBhbWRncHVfZGlzY292ZXJ5X2dldF9nZnhfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JYmhkciA9IChzdHJ1Y3QgYmluYXJ5
X2hlYWRlciAqKShhZGV2LT5kaXNjb3ZlcnkgKyBQU1BfSEVBREVSX1NJWkUpOworCWJoZHIgPSAo
c3RydWN0IGJpbmFyeV9oZWFkZXIgKilhZGV2LT5kaXNjb3Zlcnk7CiAJZ2NfaW5mbyA9IChzdHJ1
Y3QgZ2NfaW5mb192MV8wICopKGFkZXYtPmRpc2NvdmVyeSArCiAJCQlsZTE2X3RvX2NwdShiaGRy
LT50YWJsZV9saXN0W0dDXS5vZmZzZXQpKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
