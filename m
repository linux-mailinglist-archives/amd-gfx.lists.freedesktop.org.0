Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956F49036
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D406E032;
	Mon, 17 Jun 2019 19:47:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEED89FA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:20 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so12278049qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ifX3TIszgyQkRtcMlkdjmRp0sPBlK69XcuwbuKgy5rc=;
 b=nuT/KiycnSBEC9DIIUBDt/J75TCCLfpWJsIn22LIRbrZ+wg1MYu9KeUbQB9FC6TV/y
 +VKJslmyjNUYS7Y8UydNB+Odbv9tD87JBS0bAiPPylOtNrwefRMPHNSO+K3MYu/HSqqO
 GbB7GyCE/GcJtyLR3Zt9/tjf0Qn0G4W5MwI6EMjYCeiKEk9QACKhLMQSXrHUANyj5M25
 wZZaoRkraQCSGI4pfafZH160Udt0O1mTy+WssEQ/6ZDCsvKRDNs/KqrArEeDP7ztnZPP
 GsJADGlO1fcjtABjbb0LCO2DLcfaWGz+IKPeRp6c7jKDxXIXk2BARyFJefkoBgSs7s05
 LLEA==
X-Gm-Message-State: APjAAAXPXuXd1idM+XEN5OXzxB/G8CG1pEBYhZtEMRiyFJjAUZViXpa7
 P0V0AAStkRA4MWUwLI31PlOCnmZkqU8q1g==
X-Google-Smtp-Source: APXvYqxuKuVzdNyQeGCoNQ+r89yUCwi42iPvPcnroTJdPOx5zrtbsYhjonwA3Jz0a7ES0I98i35xYA==
X-Received: by 2002:ac8:3014:: with SMTP id f20mr96354903qte.69.1560800839095; 
 Mon, 17 Jun 2019 12:47:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 383/459] drm/amd/display: Add 3dlut control flags
Date: Mon, 17 Jun 2019 14:45:24 -0500
Message-Id: <20190617194540.18497-84-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ifX3TIszgyQkRtcMlkdjmRp0sPBlK69XcuwbuKgy5rc=;
 b=cmb1lwUL0gBu4Q4wmbvF5sDsqa1udDOYDKewvz/UzvvgHw42R+za1AQ94l3zK0R2gC
 4n5hMf5+Lf6IJn6rkJhM7K9u19ZJg+AByJsFKpTA1z33VZvEy06kGQDy8tjpeEh91BiP
 t8tac7o+1FaBL4TxTb5KOKcEgoLdUCtU3sEiDSkUD1CbZ2YFKugF9pulDPjcWNs1sX0U
 Yf2H/e5G1yA+cSOpjgofLinVH+Ut9btI43TQnYvSESOyVHRAJXBSDv6X9PNKXByrUY2S
 KzS4iP8u30eGk4hf6XMTncPjNvvyxnoJl1MotJmSIv9zr0I1m8hW6JwzVSumhRNZbMni
 rHCA==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Vitaly Prosyak <Vitaly.Prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpbV2h5ICYgSG93
XQpUaGUgZm9sbG93IHVwIGNoYW5nZQpJbXByb3ZlIHNvbWUgbmFtaW5nIGZvciBmaWVsZHMgYW5k
IHN0cnVjdHMKClNpZ25lZC1vZmYtYnk6IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0Bh
bWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+CkFja2VkLWJ5
OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KQWNrZWQtYnk6
IFZpdGFseSBQcm9zeWFrIDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2luYy9tb2Rfc2hhcmVkLmggIHwgMzYgKysrKysrKysrLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luYy9tb2Rfc2hh
cmVkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmMvbW9kX3NoYXJl
ZC5oCmluZGV4IDVhNjMxODU0ZWZkYS4uOTQwNmQwYTE2N2VlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmMvbW9kX3NoYXJlZC5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luYy9tb2Rfc2hhcmVkLmgKQEAgLTQ2LDM1
ICs0NiwzNSBAQCBlbnVtIHZycl9wYWNrZXRfdHlwZSB7CiB9OwogCiAjaWYgZGVmaW5lZChDT05G
SUdfRFJNX0FNRF9EQ19EQ04yXzApCi11bmlvbiB0bTNkbHV0X2ludGVybmFsX2ZsYWdzIHsKK3Vu
aW9uIGx1dDNkX2NvbnRyb2xfZmxhZ3MgewogCXVuc2lnbmVkIGludCByYXc7CiAJc3RydWN0IHsK
LQkJdW5zaWduZWQgaW50IGRvY2hyb21hX3NjYWxlCQkJOjE7Ci0JCXVuc2lnbmVkIGludCBzcGVj
X3ZlcnNpb24JCQk6MzsKLQkJdW5zaWduZWQgaW50IHVzZV96ZXJvX2Rpc3BsYXlfYmxhY2sgIDox
OwotCQl1bnNpZ25lZCBpbnQgdXNlX3plcm9fc291cmNlX2JsYWNrICA6MTsKLQkJdW5zaWduZWQg
aW50IGZvcmNlX2Rpc3BsYXlfYmxhY2sJCTo2OwotCQl1bnNpZ25lZCBpbnQgYXBwbHlfZGlzcGxh
eV9nYW1tYQk6MTsKLQkJdW5zaWduZWQgaW50IGV4cF9zaGFwZXJfbWF4CQkJOjY7Ci0JCXVuc2ln
bmVkIGludCB1bml0eTNkbHV0CQkJCToxOwotCQl1bnNpZ25lZCBpbnQgYnlwYXNzM2RsdXQJCQk6
MTsKLQkJdW5zaWduZWQgaW50IHVzZTNkbHV0CQkJCToxOwotCQl1bnNpZ25lZCBpbnQgbGVzc190
aGFuX2RjaXAzCQk6MTsKLQkJdW5zaWduZWQgaW50IG92ZXJyaWRlX2x1bQkJCToxOwotCQl1bnNp
Z25lZCBpbnQgcmVzZXZlZAkJCQk6ODsKKwkJdW5zaWduZWQgaW50IGRvX2Nocm9tYV9zY2FsZQkJ
CQk6MTsKKwkJdW5zaWduZWQgaW50IHNwZWNfdmVyc2lvbgkJCQk6MzsKKwkJdW5zaWduZWQgaW50
IHVzZV96ZXJvX2Rpc3BsYXlfYmxhY2sJCQk6MTsKKwkJdW5zaWduZWQgaW50IHVzZV96ZXJvX3Nv
dXJjZV9ibGFjawkJCToxOworCQl1bnNpZ25lZCBpbnQgZm9yY2VfZGlzcGxheV9ibGFjawkJCTo2
OworCQl1bnNpZ25lZCBpbnQgYXBwbHlfZGlzcGxheV9nYW1tYQkJCToxOworCQl1bnNpZ25lZCBp
bnQgZXhwX3NoYXBlcl9tYXgJCQkJOjY7CisJCXVuc2lnbmVkIGludCB1bml0eV8zZGx1dAkJCQk6
MTsKKwkJdW5zaWduZWQgaW50IGJ5cGFzc18zZGx1dAkJCQk6MTsKKwkJdW5zaWduZWQgaW50IHVz
ZV8zZGx1dAkJCQkJOjE7CisJCXVuc2lnbmVkIGludCBsZXNzX3RoYW5fZGNpcDMJCQkJOjE7CisJ
CXVuc2lnbmVkIGludCBvdmVycmlkZV9sdW0JCQkJOjE7CisJCXVuc2lnbmVkIGludCByZXNldmVk
CQkJCQk6ODsKIAl9IGJpdHM7CiB9OwogCiBlbnVtIHRtX3Nob3dfb3B0aW9uX2ludGVybmFsIHsK
IAl0bV9zaG93X29wdGlvbl9pbnRlcm5hbF9zaW5nbGVfZmlsZQkJPSAwLC8qZmxhZ3MyIG5vdCBp
biB1c2UqLwotCXRtX3Nob3dfb3B0aW9uX2ludGVybmFsX2R1cGxpY2F0ZV9maWxlLC8qdXNlIGZs
YWdzMiovCisJdG1fc2hvd19vcHRpb25faW50ZXJuYWxfZHVwbGljYXRlX2ZpbGUsCQkvKnVzZSBm
bGFnczIqLwogCXRtX3Nob3dfb3B0aW9uX2ludGVybmFsX2R1cGxpY2F0ZV9zaWRlYnlzaWRlLyp1
c2UgZmxhZ3MyKi8KIH07CiAKLXN0cnVjdCB0bTNkbHV0X3NldHRpbmdzIHsKK3N0cnVjdCBsdXQz
ZF9zZXR0aW5ncyB7CiAJdW5zaWduZWQgY2hhciB2ZXJzaW9uOwotCXVuaW9uIHRtM2RsdXRfaW50
ZXJuYWxfZmxhZ3MgZmxhZ3M7Ci0JdW5pb24gdG0zZGx1dF9pbnRlcm5hbF9mbGFncyBmbGFnczI7
CisJdW5pb24gbHV0M2RfY29udHJvbF9mbGFncyBmbGFnczsKKwl1bmlvbiBsdXQzZF9jb250cm9s
X2ZsYWdzIGZsYWdzMjsKIAllbnVtIHRtX3Nob3dfb3B0aW9uX2ludGVybmFsIG9wdGlvbjsKIAl1
bnNpZ25lZCBpbnQgbWluX2x1bTsvKm11bHRpcGxpZWQgYnkgMTAwKi8KIAl1bnNpZ25lZCBpbnQg
bWF4X2x1bTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
