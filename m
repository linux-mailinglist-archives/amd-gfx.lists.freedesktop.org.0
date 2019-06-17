Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562A4902A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09989FE3;
	Mon, 17 Jun 2019 19:47:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF4C89F3C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:10 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id m29so12328203qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49N+1/+I/zsqD8WeTZBeoXJ5NUn69b3Xcnou6P9TRaQ=;
 b=LqZa92uu7JOTz1IkoY3RU2ytjcwf8G9UfbHv87uE6LueF/ItIgjbKQ27m9aNmf3c03
 YwrRAKOpquTE5Fm+wL/phK0a/FVgk3V8dt8ClwvISI1U9WncPSGAYvgqfFR9bpYawjc6
 FycjFGllh+VDpqGUAwn0TriBGHa0ZPvzL0kWikTsvjsWnXvMGFpaCwSBLhFa3bnLF5VZ
 u1CKg1VKPFexy6l6eAyda+rkxLg5lj/ZFat0vTk7ysubdT9zKFE1HEMvMpR6bhGr9PCq
 hx37I4fnu1vVkKDoJ9IyVIlPVI+Y13yushPWFZMAInt9Koopsbx4O0WwniV8AXh2fcAF
 utlA==
X-Gm-Message-State: APjAAAVSLFLSPRLMA1lO9/uUjaORUpj0S5kc/XkQDHGzArrvtR5IIWMQ
 b8UrOkeyy2Pe/zOeDRYYA1piZPPFJIHs2g==
X-Google-Smtp-Source: APXvYqzvigZvcd3gL9KpmE5LLOPB07KKW/9Es7ij/d9ajc7+zTbM5Z09Vu26rk+XTzHsf9Mi4nKAAg==
X-Received: by 2002:a0c:e6a2:: with SMTP id j2mr21906520qvn.190.1560800829714; 
 Mon, 17 Jun 2019 12:47:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 373/459] drm/amd/display: fix fpga fclk programming
Date: Mon, 17 Jun 2019 14:45:14 -0500
Message-Id: <20190617194540.18497-74-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=49N+1/+I/zsqD8WeTZBeoXJ5NUn69b3Xcnou6P9TRaQ=;
 b=BDyKERfISLlB12HfKA+U6PDSlwcUFxFD9pm4F212jmWmKNv1zf59zVDBNCPrkhM5So
 NSeBX9Hnw1Gir6urBPvclUlGDzbvVuO8qsWlCu5XhwgryU9n/DBJjZsJqp7qvPLIl/rD
 t+A8OSM54i0cyCzII8mS7pbkPceaFi/kln/nlIKFsacyQ+E0wRY7Yrq0FixfEqgK8+8I
 3KrdQxt3ug+uYAz8xHtfckAxuo8BjrR0JvMpJ64ovkl6HXYh+kE1ykZmQqzZOT7Zr2Xz
 cs/nwm0dH4VyWPMZxKrG2FQhfeQ23RxKi3Vhm7uIYm6WJSgl5sCkR5czRH5hG376etFK
 oKqg==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCldl
IHNob3VsZG50IG5lZWQgb3ZlcmhlYWQgb24gdG9wIG9mIGRwcGNsayB3aGVuIHNldHRpbmcgZmNs
ay4KClNpZ25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2lu
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBFcmljIEJlcm5zdGVpbiA8RXJpYy5CZXJuc3RlaW5AYW1k
LmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9j
bGtfbWdyLmMgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKaW5kZXggMzQ0MDJkZmZkMmNh
Li5jMTUxMWM5ZWRkNDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKQEAgLTI0OSw2ICsyNDks
OCBAQCB2b2lkIGRjbjJfdXBkYXRlX2Nsb2Nrc19mcGdhKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdy
LAogCQlib29sIHNhZmVfdG9fbG93ZXIpCiB7CiAJc3RydWN0IGRjX2Nsb2NrcyAqbmV3X2Nsb2Nr
cyA9ICZjb250ZXh0LT5id19jdHguYncuZGNuLmNsazsKKwkvKiBNaW4gZmNsayA9IDFHSHogc2lu
Y2UgYWxsIHRoZSBleHRyYSBzY2VtaSBsb2dpYyBzZWVtcyB0byBydW4gb2ZmIG9mIGl0ICovCisJ
aW50IGZjbGtfYWRqID0gbmV3X2Nsb2Nrcy0+ZmNsa19raHogPiAxMDAwMDAwID8gbmV3X2Nsb2Nr
cy0+ZmNsa19raHogOiAxMDAwMDAwOwogCiAJaWYgKHNob3VsZF9zZXRfY2xvY2soc2FmZV90b19s
b3dlciwgbmV3X2Nsb2Nrcy0+cGh5Y2xrX2toeiwgY2xrX21nci0+Y2xrcy5waHljbGtfa2h6KSkg
ewogCQljbGtfbWdyLT5jbGtzLnBoeWNsa19raHogPSBuZXdfY2xvY2tzLT5waHljbGtfa2h6OwpA
QCAtMjc1LDkgKzI3Nyw4IEBAIHZvaWQgZGNuMl91cGRhdGVfY2xvY2tzX2ZwZ2Eoc3RydWN0IGNs
a19tZ3IgKmNsa19tZ3IsCiAJCWNsa19tZ3ItPmNsa3MuZHBwY2xrX2toeiA9IG5ld19jbG9ja3Mt
PmRwcGNsa19raHo7CiAJfQogCi0JLyogQWRkIDI1ME1IeiBhcyBzYWZldHkgbWFyZ2luICovCi0J
aWYgKHNob3VsZF9zZXRfY2xvY2soc2FmZV90b19sb3dlciwgbmV3X2Nsb2Nrcy0+ZmNsa19raHog
KyAyNTAwMDAsIGNsa19tZ3ItPmNsa3MuZmNsa19raHopKSB7Ci0JCWNsa19tZ3ItPmNsa3MuZmNs
a19raHogPSBuZXdfY2xvY2tzLT5mY2xrX2toeiArIDI1MDAwMDsKKwlpZiAoc2hvdWxkX3NldF9j
bG9jayhzYWZlX3RvX2xvd2VyLCBmY2xrX2FkaiwgY2xrX21nci0+Y2xrcy5mY2xrX2toeikpIHsK
KwkJY2xrX21nci0+Y2xrcy5mY2xrX2toeiA9IGZjbGtfYWRqOwogCX0KIAogCWlmIChzaG91bGRf
c2V0X2Nsb2NrKHNhZmVfdG9fbG93ZXIsIG5ld19jbG9ja3MtPmRpc3BjbGtfa2h6LCBjbGtfbWdy
LT5jbGtzLmRpc3BjbGtfa2h6KSkgewpAQCAtMjg5LDYgKzI5MCw4IEBAIHZvaWQgZGNuMl91cGRh
dGVfY2xvY2tzX2ZwZ2Eoc3RydWN0IGNsa19tZ3IgKmNsa19tZ3IsCiAJICovCiAJaWYgKGNsa19t
Z3ItPmNsa3MuZmNsa19raHogPiBjbGtfbWdyLT5jbGtzLmRwcGNsa19raHopCiAJCWNsa19tZ3It
PmNsa3MuZHBwY2xrX2toeiA9IGNsa19tZ3ItPmNsa3MuZmNsa19raHo7CisJaWYgKGNsa19tZ3It
PmNsa3MuZHBwY2xrX2toeiA+IGNsa19tZ3ItPmNsa3MuZmNsa19raHopCisJCWNsa19tZ3ItPmNs
a3MuZmNsa19raHogPSBjbGtfbWdyLT5jbGtzLmRwcGNsa19raHo7CiAKIAlkbV9zZXRfZGNuX2Ns
b2NrcyhjbGtfbWdyLT5jdHgsICZjbGtfbWdyLT5jbGtzKTsKIH0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
