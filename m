Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D83C7143
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Jul 2021 15:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1FC6E0A5;
	Tue, 13 Jul 2021 13:32:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C2F89807
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Jul 2021 13:32:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id l6so5370136wmq.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Jul 2021 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CWHFtXhpCFJrQSuXJAwjb489EAQsGDMO2zOi12Btsw=;
 b=u+fqiq39zYs2H2coIKETERiRVxHe0wHVujw2fp1cNUjFMjRrOxj5YEe5fZQR1OUQxG
 0KHTKAWNGlWKPqzvnTd9BhabxlbbbhAjskhHTaggxODW+xlQzNCGJkT7yBeIjmdtcRW4
 b75x1c3VJ3sxk2VDpbhuoKuv/Zh6yttPY6zJ2al1iA4YHO3E/iLUgHEwa8x0zqwMs1Dz
 7fV2T3b2KPTk5KlrAsQbap6+jjHj5TLvg/lk0bP1k5xmdeodkYJFwdsWhQEwY918x0qy
 1enaGe8K1nru94QmNb0NA6SXm71LmPQI8oNeCIbO6S97A7TVPKyJ7lFxps4g4oplrCf0
 ZVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CWHFtXhpCFJrQSuXJAwjb489EAQsGDMO2zOi12Btsw=;
 b=Qcoa2mnNa8/8iwjE3mw1qAO70EVWhXR9p6Hatv5gEXHcS1KUrYGUw+ygPEX2UKNyKN
 ARdUHwhxG3C2Kvm9XG3kWFTXqVoTWEQjEs9MyMzIqdWKU8A3R+im6O1inbGHngV72INl
 6HNDOGkZYXkivl9Egxg7SmH2vZTz3uZcl0mMuO/gy9pPv1t8WipS+xngH4Eq9E5SEAdN
 xTQ/VWI8HqE9A6nRy3QHwELC7p5kcnJNw5/U8k0wcZFjjooltJc8C50XXyHDyk7anPwR
 WJx5f0a8vBP9J74bhJltCRyuVVz9Kyg+3sgPqEh18EbYGzTGs05hKbJphL4z06p89k1w
 ZgqA==
X-Gm-Message-State: AOAM53005lqhrwMt95J9Kb/YYhyRsseGFyApDxUiEPgSak8h1pwsp2a4
 NOrFq5bhRM9S5+WGadXjD3hoo8Knglc=
X-Google-Smtp-Source: ABdhPJzp9VceuKxRhQIAIdWT5rPvzWow0xSXe1qF/Rn7lZYf5fVDX/sq1r0ogEcaCdcGAx6yBrkT8w==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr5151224wmb.118.1626183176616; 
 Tue, 13 Jul 2021 06:32:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b849:f266:6e77:b501])
 by smtp.gmail.com with ESMTPSA id x1sm15532568wmc.31.2021.07.13.06.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:32:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: jinhuieric.huang@amd.com
Subject: [PATCH] drm/amdgpu: further lower VRAM allocation overhead
Date: Tue, 13 Jul 2021 15:32:55 +0200
Message-Id: <20210713133255.16456-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: felix.kuehling@amd.com, amd-gfx@lists.freedesktop.org, Luugi.Marsan@amd.com,
 Jenny-Jing.Liu@amd.com, Chris.Mason@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIGFsbG9jYXRpb25zIGxhcmdlciB0aGFuIDQ4TWlCIHdlIG5lZWQgbW9yZSB0aGFuIGEgcGFn
ZSBmb3IgdGhlCmhvdXNla2VlcGluZyBpbiB0aGUgd29yc3QgY2FzZSByZXN1bHRpbmcgaW4gdGhl
IHVzdWFsIHZtYWxsb2Mgb3ZlcmhlYWQuCgpUcnkgdG8gYXZvaWQgdGhpcyBieSBhc3N1bWluZyB0
aGUgZ29vZCBjYXNlIGFuZCBvbmx5IGZhbGxpbmcgYmFjayB0byB0aGUKd29yc3QgY2FzZSBpZiB0
aGlzIGRpZG4ndCB3b3JrZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZyYW1fbWdyLmMgfCA4MCArKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDYwIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKaW5kZXggMmZkNzdjMzZhMWZmLi5hYjhjNWUyOGRm
N2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21n
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCkBA
IC0zNjEsMTkgKzM2MSwyMyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdnJhbV9tZ3JfdmlydF9zdGFy
dChzdHJ1Y3QgdHRtX3Jlc291cmNlICptZW0sCiAgKiBAbWFuOiBUVE0gbWVtb3J5IHR5cGUgbWFu
YWdlcgogICogQHRibzogVFRNIEJPIHdlIG5lZWQgdGhpcyByYW5nZSBmb3IKICAqIEBwbGFjZTog
cGxhY2VtZW50IGZsYWdzIGFuZCByZXN0cmljdGlvbnMKLSAqIEBtZW06IHRoZSByZXN1bHRpbmcg
bWVtIG9iamVjdAorICogQG51bV9ub2RlczogbnVtYmVyIG9mIHBhZ2Ugbm9kZXMgdG8gdXNlLgor
ICogQHBhZ2VzX3Blcl9ub2RlOiBudW1iZXIgb2YgcGFnZXMgcGVyIG5vZGUgdG8gdXNlLgorICog
QHJlczogdGhlIHJlc3VsdGluZyBtZW0gb2JqZWN0CiAgKgogICogQWxsb2NhdGUgVlJBTSBmb3Ig
dGhlIGdpdmVuIEJPLgogICovCiBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0
IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sCiAJCQkgICAgICAgc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICp0Ym8sCiAJCQkgICAgICAgY29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UsCisJ
CQkgICAgICAgdW5zaWduZWQgbG9uZyBudW1fbm9kZXMsCisJCQkgICAgICAgdW5zaWduZWQgbG9u
ZyBwYWdlc19wZXJfbm9kZSwKIAkJCSAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICoqcmVzKQog
ewotCXVuc2lnbmVkIGxvbmcgbHBmbiwgbnVtX25vZGVzLCBwYWdlc19wZXJfbm9kZSwgcGFnZXNf
bGVmdCwgcGFnZXM7CiAJc3RydWN0IGFtZGdwdV92cmFtX21nciAqbWdyID0gdG9fdnJhbV9tZ3Io
bWFuKTsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHRvX2FtZGdwdV9kZXZpY2UobWdy
KTsKIAl1aW50NjRfdCB2aXNfdXNhZ2UgPSAwLCBtZW1fYnl0ZXMsIG1heF9ieXRlczsKKwl1bnNp
Z25lZCBsb25nIGxwZm4sIHBhZ2VzX2xlZnQsIHBhZ2VzOwogCXN0cnVjdCB0dG1fcmFuZ2VfbWdy
X25vZGUgKm5vZGU7CiAJc3RydWN0IGRybV9tbSAqbW0gPSAmbWdyLT5tbTsKIAllbnVtIGRybV9t
bV9pbnNlcnRfbW9kZSBtb2RlOwpAQCAtMzk1LDIxICszOTksNiBAQCBzdGF0aWMgaW50IGFtZGdw
dV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sCiAJCWdvdG8g
ZXJyb3Jfc3ViOwogCX0KIAotCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdV
T1VTKSB7Ci0JCXBhZ2VzX3Blcl9ub2RlID0gfjB1bDsKLQkJbnVtX25vZGVzID0gMTsKLQl9IGVs
c2UgewotI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQotCQlwYWdlc19wZXJfbm9k
ZSA9IEhQQUdFX1BNRF9OUjsKLSNlbHNlCi0JCS8qIGRlZmF1bHQgdG8gMk1CICovCi0JCXBhZ2Vz
X3Blcl9ub2RlID0gMlVMIDw8ICgyMFVMIC0gUEFHRV9TSElGVCk7Ci0jZW5kaWYKLQkJcGFnZXNf
cGVyX25vZGUgPSBtYXhfdCh1aW50MzJfdCwgcGFnZXNfcGVyX25vZGUsCi0JCQkJICAgICAgIHRi
by0+cGFnZV9hbGlnbm1lbnQpOwotCQludW1fbm9kZXMgPSBESVZfUk9VTkRfVVBfVUxMKFBGTl9V
UChtZW1fYnl0ZXMpLCBwYWdlc19wZXJfbm9kZSk7Ci0JfQotCiAJbm9kZSA9IGt2bWFsbG9jKHN0
cnVjdF9zaXplKG5vZGUsIG1tX25vZGVzLCBudW1fbm9kZXMpLAogCQkJR0ZQX0tFUk5FTCB8IF9f
R0ZQX1pFUk8pOwogCWlmICghbm9kZSkgewpAQCAtNDMxLDEwICs0MjAsMTUgQEAgc3RhdGljIGlu
dCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAog
CWkgPSAwOwogCXNwaW5fbG9jaygmbWdyLT5sb2NrKTsKIAl3aGlsZSAocGFnZXNfbGVmdCkgewot
CQl1aW50MzJfdCBhbGlnbm1lbnQgPSB0Ym8tPnBhZ2VfYWxpZ25tZW50OworCQl1bnNpZ25lZCBs
b25nIGFsaWdubWVudCA9IHRiby0+cGFnZV9hbGlnbm1lbnQ7CisKKwkJaWYgKGkgPj0gbnVtX25v
ZGVzKSB7CisJCQlyID0gLUUyQklHOworCQkJZ290byBlcnJvcl9mcmVlOworCQl9CiAKIAkJaWYg
KHBhZ2VzID49IHBhZ2VzX3Blcl9ub2RlKQotCQkJYWxpZ25tZW50ID0gcGFnZXNfcGVyX25vZGU7
CisJCQlhbGlnbm1lbnQgPSBtYXgoYWxpZ25tZW50LCBwYWdlc19wZXJfbm9kZSk7CiAKIAkJciA9
IGRybV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZShtbSwgJm5vZGUtPm1tX25vZGVzW2ldLCBwYWdl
cywKIAkJCQkJCWFsaWdubWVudCwgMCwgcGxhY2UtPmZwZm4sCkBAIC00ODMsNiArNDc3LDUyIEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFn
ZXIgKm1hbiwKIAlyZXR1cm4gcjsKIH0KIAorLyoqCisgKiBhbWRncHVfdnJhbV9tZ3JfYWxsb2Mg
LSBhbGxvY2F0ZSBuZXcgcmFuZ2UKKyAqCisgKiBAbWFuOiBUVE0gbWVtb3J5IHR5cGUgbWFuYWdl
cgorICogQHRibzogVFRNIEJPIHdlIG5lZWQgdGhpcyByYW5nZSBmb3IKKyAqIEBwbGFjZTogcGxh
Y2VtZW50IGZsYWdzIGFuZCByZXN0cmljdGlvbnMKKyAqIEByZXM6IHRoZSByZXN1bHRpbmcgbWVt
IG9iamVjdAorICoKKyAqIEFsbG9jYXRlIFZSQU0gZm9yIHRoZSBnaXZlbiBCTy4KKyAqLworc3Rh
dGljIGludCBhbWRncHVfdnJhbV9tZ3JfYWxsb2Moc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2Vy
ICptYW4sCisJCQkJIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvLAorCQkJCSBjb25zdCBz
dHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKKwkJCQkgc3RydWN0IHR0bV9yZXNvdXJjZSAqKnJlcykK
K3sKKwl1bnNpZ25lZCBsb25nIG51bV9ub2RlcywgcGFnZXNfcGVyX25vZGU7CisJc3RydWN0IHR0
bV9yYW5nZV9tZ3Jfbm9kZSAqbm9kZTsKKwlpbnQgcjsKKworCWlmIChwbGFjZS0+ZmxhZ3MgJiBU
VE1fUExfRkxBR19DT05USUdVT1VTKQorCQlyZXR1cm4gYW1kZ3B1X3ZyYW1fbWdyX25ldyhtYW4s
IHRibywgcGxhY2UsIDEsIH4wdWwsIHJlcyk7CisKKyNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRf
SFVHRVBBR0UKKwlwYWdlc19wZXJfbm9kZSA9IEhQQUdFX1BNRF9OUjsKKyNlbHNlCisJLyogZGVm
YXVsdCB0byAyTUIgKi8KKwlwYWdlc19wZXJfbm9kZSA9IDJVTCA8PCAoMjBVTCAtIFBBR0VfU0hJ
RlQpOworI2VuZGlmCisJcGFnZXNfcGVyX25vZGUgPSBtYXhfdCh1aW50MzJfdCwgcGFnZXNfcGVy
X25vZGUsIHRiby0+cGFnZV9hbGlnbm1lbnQpOworCW51bV9ub2RlcyA9IERJVl9ST1VORF9VUF9V
TEwoUEZOX1VQKHRiby0+YmFzZS5zaXplKSwgcGFnZXNfcGVyX25vZGUpOworCisJaWYgKHN0cnVj
dF9zaXplKG5vZGUsIG1tX25vZGVzLCBudW1fbm9kZXMpID4gUEFHRV9TSVpFKSB7CisJCXNpemVf
dCBzaXplID0gUEFHRV9TSVpFOworCisJCXNpemUgLT0gc2l6ZW9mKHN0cnVjdCB0dG1fcmFuZ2Vf
bWdyX25vZGUpOworCQlzaXplIC89IHNpemVvZihzdHJ1Y3QgZHJtX21tX25vZGUpOworCQlyID0g
YW1kZ3B1X3ZyYW1fbWdyX25ldyhtYW4sIHRibywgcGxhY2UsIHNpemUsIHBhZ2VzX3Blcl9ub2Rl
LAorCQkJCQlyZXMpOworCQlpZiAociAhPSAtRTJCSUcpCisJCQlyZXR1cm4gcjsKKwl9CisKKwly
ZXR1cm4gYW1kZ3B1X3ZyYW1fbWdyX25ldyhtYW4sIHRibywgcGxhY2UsIG51bV9ub2RlcywgcGFn
ZXNfcGVyX25vZGUsCisJCQkJICAgcmVzKTsKK30KKwogLyoqCiAgKiBhbWRncHVfdnJhbV9tZ3Jf
ZGVsIC0gZnJlZSByYW5nZXMKICAqCkBAIC02ODAsNyArNzIwLDcgQEAgc3RhdGljIHZvaWQgYW1k
Z3B1X3ZyYW1fbWdyX2RlYnVnKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAogfQog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2Z1bmMgYW1kZ3B1X3Zy
YW1fbWdyX2Z1bmMgPSB7Ci0JLmFsbG9jCT0gYW1kZ3B1X3ZyYW1fbWdyX25ldywKKwkuYWxsb2MJ
PSBhbWRncHVfdnJhbV9tZ3JfYWxsb2MsCiAJLmZyZWUJPSBhbWRncHVfdnJhbV9tZ3JfZGVsLAog
CS5kZWJ1Zwk9IGFtZGdwdV92cmFtX21ncl9kZWJ1ZwogfTsKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
