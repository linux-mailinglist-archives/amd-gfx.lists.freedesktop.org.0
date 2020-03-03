Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFAA17765C
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Mar 2020 13:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04D86EA2C;
	Tue,  3 Mar 2020 12:47:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4ED89CD8
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Mar 2020 12:47:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z15so4209658wrl.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Mar 2020 04:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y70ZWJg2MqIcap4IHImwxTsaUh3eQBnQEMR7Yl4Nubg=;
 b=HKpcIAE1p3V1QOCYF6hNHJoZX7WbJsvS383rozCra6VYsLwOYXct+bzD1HFRnUeBQE
 9ysBtjiwDMzd888k1sV4f1nwrlXsZjo6dpXRHUxUInGlt+ZGPtR/a2cL5vxGpgbWpq5T
 NgdGgJ87lT9w4ILFRj6OC8xgE39Lo45cki4ok5S3TWebq8LgCz+7izELFsnpACPD22vd
 +NnJVH6l94HW/nf6OuQygrMvLkZ4IS0CGw1j7/EsN4bJi+lSjV+esF9hW9ZnShbV8fnv
 v6gsho6tNZ3EgrLOh68e8czM/ZMky6HFa6pGAoB0DA3CZ7fCrsElbbVju7bHCSyBqaei
 Uwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y70ZWJg2MqIcap4IHImwxTsaUh3eQBnQEMR7Yl4Nubg=;
 b=aW11gKvrxt/qOdGiUJA3P/RY+NMr9MWPfqGg70MegSTMcylns7QJrfAcBT0Eaypf56
 bwdOfwYR2lmkBlWtDjjko0//VajTtzNoJWgi6pL37smMKhcl0FC1VaH70Y0gvYkrpS4n
 mNNfOCia2sl3YOcV8EjMVRD0VgoAUQG4S0tXpRRYMgWHohhau4oiSs/snmteYfPsB7Sm
 ZLLQ8mhZ/5s2dKWeKB1e6ldaD2YRPtZWGIgBQn7F1gk4e1Kvkf3IM5CziDvCv3qP8NPt
 1+3ifsDh10jg7z9l8wjgNfpfE1T0AmgfynWEsKrG6OaRMd/WfbWsll6CcQQmGYinavpm
 UMwg==
X-Gm-Message-State: ANhLgQ2D/5WREJLkG06YChN69tUmhEK5alYbSGXHFkidHI1cSs1ZG15v
 HeFS/BxG0N9dV7TUsO7d9kFhJtp+
X-Google-Smtp-Source: ADFU+vthFkqUJZvql7fleBMX45ham7CuRE0EAInO+AgRe/kTf//91ZKwk8D3ya7PO1c7rXll+zjlYw==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr5247560wrv.318.1583239643783; 
 Tue, 03 Mar 2020 04:47:23 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F27F600CCD821CDE339F0DA.dip0.t-ipconnect.de.
 [2003:c5:8f27:f600:ccd8:21cd:e339:f0da])
 by smtp.gmail.com with ESMTPSA id x8sm21760468wro.55.2020.03.03.04.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 04:47:23 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/scheduler: implement a function to modify sched
 list
Date: Tue,  3 Mar 2020 13:50:37 +0100
Message-Id: <20200303125039.53141-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200303125039.53141-1-nirmoy.das@amd.com>
References: <20200303125039.53141-1-nirmoy.das@amd.com>
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW1wbGVtZW50IGRybV9zY2hlZF9lbnRpdHlfbW9kaWZ5X3NjaGVkKCkgd2hpY2ggY2FuIG1vZGlm
eSBleGlzdGluZwpzY2hlZF9saXN0IHdpdGggYSBkaWZmZXJlbnQgb25lLiBUaGlzIGlzIGdvaW5n
IHRvIGJlIGhlbHBmdWwgd2hlbgp1c2Vyc3BhY2UgY2hhbmdlcyBwcmlvcml0eSBvZiBhIGN0eC9l
bnRpdHkgdGhlbiBkcml2ZXIgY2FuIHN3aXRjaCB0bwpjb3JyZXNwb25kaW5nIGh3IHNoY2VkIGxp
c3QgZm9yIHRoYXQgcHJpb3JpdHkKClNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5k
YXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5j
IHwgMTkgKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAg
ICAgICAgICAgICB8ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCmluZGV4IDYzYmNjZDIwMWI5
Ny4uYjk0MzEyMTU0ZTU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX2VudGl0eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5
LmMKQEAgLTgzLDYgKzgzLDI1IEBAIGludCBkcm1fc2NoZWRfZW50aXR5X2luaXQoc3RydWN0IGRy
bV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2VudGl0
eV9pbml0KTsKCisvKioKKyAqIGRybV9zY2hlZF9lbnRpdHlfbW9kaWZ5X3NjaGVkIC0gTW9kaWZ5
IHNjaGVkIG9mIGFuIGVudGl0eQorICoKKyAqIEBlbnRpdHk6IHNjaGVkdWxlciBlbnRpdHkgdG8g
aW5pdAorICogQHNjaGVkX2xpc3Q6IHRoZSBsaXN0IG9mIG5ldyBkcm0gc2NoZWRzIHdoaWNoIHdp
bGwgcmVwbGFjZQorICoJCWV4aXN0aW5nIGVudGl0eS0+c2NoZWRfbGlzdAorICogQG51bV9zY2hl
ZF9saXN0OiBudW1iZXIgb2YgZHJtIHNjaGVkIGluIHNjaGVkX2xpc3QKKyAqLwordm9pZCBkcm1f
c2NoZWRfZW50aXR5X21vZGlmeV9zY2hlZChzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5
LAorCQkJCSAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICoqc2NoZWRfbGlzdCwKKwkJCQkgIHVu
c2lnbmVkIGludCBudW1fc2NoZWRfbGlzdCkKK3sKKwlXQVJOX09OKCFudW1fc2NoZWRfbGlzdCB8
fCAhc2NoZWRfbGlzdCk7CisKKwllbnRpdHktPnNjaGVkX2xpc3QgPSBzY2hlZF9saXN0OworCWVu
dGl0eS0+bnVtX3NjaGVkX2xpc3QgPSBudW1fc2NoZWRfbGlzdDsKK30KK0VYUE9SVF9TWU1CT0wo
ZHJtX3NjaGVkX2VudGl0eV9tb2RpZnlfc2NoZWQpOworCiAvKioKICAqIGRybV9zY2hlZF9lbnRp
dHlfaXNfaWRsZSAtIENoZWNrIGlmIGVudGl0eSBpcyBpZGxlCiAgKgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oIGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oCmlu
ZGV4IDU4OWJlODUxZjhhMS4uZjcwYTg0YWFhZjdhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9n
cHVfc2NoZWR1bGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oCkBAIC0yOTcs
NiArMjk3LDEwIEBAIHZvaWQgZHJtX3NjaGVkX2Zpbmkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVy
ICpzY2hlZCk7CiBpbnQgZHJtX3NjaGVkX2pvYl9pbml0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpq
b2IsCiAJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5LAogCQkgICAgICAg
dm9pZCAqb3duZXIpOwordm9pZCBkcm1fc2NoZWRfZW50aXR5X21vZGlmeV9zY2hlZChzdHJ1Y3Qg
ZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5LAorCQkJCSAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVy
ICoqc2NoZWRfbGlzdCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgbnVtX3NjaGVkX2xpc3QpOworCiB2b2lkIGRybV9zY2hlZF9qb2JfY2xlYW51cChzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiAqam9iKTsKIHZvaWQgZHJtX3NjaGVkX3dha2V1cChzdHJ1Y3QgZHJt
X2dwdV9zY2hlZHVsZXIgKnNjaGVkKTsKIHZvaWQgZHJtX3NjaGVkX3N0b3Aoc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyICpzY2hlZCwgc3RydWN0IGRybV9zY2hlZF9qb2IgKmJhZCk7Ci0tCjIuMjUu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
