Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343FC49034
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1C46E033;
	Mon, 17 Jun 2019 19:47:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AC889FEC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j19so12258690qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ft4HDujCGfLbJf8ncgVvho7x7F6i/tKO9RZew15pAM0=;
 b=p0DJpZpEgOkQA9gN3jurzdBaE/XeK+AKWkMFYnckCwO0ilMB1hFjvjBU5Op/6FBFHl
 vfPV4Mo6gc49HiKIOaTw6pbQaHE+1jOks7X/KxicX7yy3ViiyQRdl/7mBBvpI4EtnP8w
 KfDOcrJrtoVcCOKQk7873poMUQPqQ45EnqMcbr2IBVAhE8fwfHY9Sx6lYQesEEToYKdH
 lht2e7PMSRHoe4qfmlUCUY6aaTsmX713lzeopsX5IvhANn6ljL1B1s0mhLnZXeSJVfmK
 fws1cSQOzRP32luRrzvVKIl5H24ywN9H7C1No1aye6VyWpapKGC6618n0q1d80sPYoPn
 MefA==
X-Gm-Message-State: APjAAAVBQP0E4CXkoHRG3WBjlPDPUR4Wc02Y9Etvh73PgCIIuLBHgnfn
 69au8DNRxWKLvFQOm0inVNeOsJz6yxQnnQ==
X-Google-Smtp-Source: APXvYqz7QaeIvtniWidmQCAN169GlvPq8VdjVGwhSaw7Vt8UptTEuTaRKMUsHBJ6rUI02g+WwZSQ9w==
X-Received: by 2002:ac8:28e2:: with SMTP id j31mr55985829qtj.274.1560800846612; 
 Mon, 17 Jun 2019 12:47:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 390/459] drm/amd/display: Change Min fclk to 1.2Ghz
Date: Mon, 17 Jun 2019 14:45:31 -0500
Message-Id: <20190617194540.18497-91-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ft4HDujCGfLbJf8ncgVvho7x7F6i/tKO9RZew15pAM0=;
 b=oe1Lr4HZzZKzEj/94jPsFPocJNz3LVN16oUEtQfAVNhg4YrLsM00UNO+qd4U8tLC57
 +Drg64UH9sjrlyq9nuazg/bWT7uH+YuEDiH1Ic5rjMyC7+Obp1nH75w5W6SZHpZlU49s
 NRDnokvbxbvnZC/DgoCoSMailM8Ua1dPpBpycvteJPEiqrJHZ/cptrHPvekMEHB/bAov
 kbYJCC4f+pdAyxbDtKHMnfzNmPgGQJtoFndxV3CrNTU+KLWTpRjjL/W7N4JsUqzrKO6f
 HTucD4cwhULbxkuqSU+r6MtoTSVdLcVSgxrAW4oTILMtD61ERdB22eU0Kqnyw9PnzgUh
 WuTg==
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
Cc: Tyler DiBattista <tyler.dibattista@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVHlsZXIgRGlCYXR0aXN0YSA8dHlsZXIuZGliYXR0aXN0YUBhbWQuY29tPgoKW1doeV0K
U29tZSBuaWdodGx5IHRlc3RzIGFyZSBmYWlsaW5nIHNpbmNlIHRoZSBuZXcgdmFsdWUgZm9yIGZj
bGsgaXMgYQpiaXQgdG9vIGxvdy4gQWxzbywgYSBuZXcgdGVzdCBmb3IgdGhlIG1heGltdW0gZG93
bnNjYWxlIGNhc2Ugd2FzCm5lZWRlZC4KCltIb3ddClVwZGF0ZWQgdGhlIGRlZmF1bHQgdmFsdWUg
Zm9yIGZjbGsgdG8gYmUgMS4yR0h6LgoKU2lnbmVkLW9mZi1ieTogVHlsZXIgRGlCYXR0aXN0YSA8
dHlsZXIuZGliYXR0aXN0YUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBCZXJuc3RlaW4gPEVy
aWMuQmVybnN0ZWluQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2Fu
cHJlZXQgTGFraGFAYW1kLmNvbT4KQWNrZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2Rj
bjIwX2Nsa19tZ3IuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKaW5kZXggYzE1MTFjOWVkZDQ4
Li5kZTQ3MWNhODdlZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKQEAgLTI0OSw4ICsyNDks
OCBAQCB2b2lkIGRjbjJfdXBkYXRlX2Nsb2Nrc19mcGdhKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdy
LAogCQlib29sIHNhZmVfdG9fbG93ZXIpCiB7CiAJc3RydWN0IGRjX2Nsb2NrcyAqbmV3X2Nsb2Nr
cyA9ICZjb250ZXh0LT5id19jdHguYncuZGNuLmNsazsKLQkvKiBNaW4gZmNsayA9IDFHSHogc2lu
Y2UgYWxsIHRoZSBleHRyYSBzY2VtaSBsb2dpYyBzZWVtcyB0byBydW4gb2ZmIG9mIGl0ICovCi0J
aW50IGZjbGtfYWRqID0gbmV3X2Nsb2Nrcy0+ZmNsa19raHogPiAxMDAwMDAwID8gbmV3X2Nsb2Nr
cy0+ZmNsa19raHogOiAxMDAwMDAwOworCS8qIE1pbiBmY2xrID0gMS4yR0h6IHNpbmNlIGFsbCB0
aGUgZXh0cmEgc2NlbWkgbG9naWMgc2VlbXMgdG8gcnVuIG9mZiBvZiBpdCAqLworCWludCBmY2xr
X2FkaiA9IG5ld19jbG9ja3MtPmZjbGtfa2h6ID4gMTIwMDAwMCA/IG5ld19jbG9ja3MtPmZjbGtf
a2h6IDogMTIwMDAwMDsKIAogCWlmIChzaG91bGRfc2V0X2Nsb2NrKHNhZmVfdG9fbG93ZXIsIG5l
d19jbG9ja3MtPnBoeWNsa19raHosIGNsa19tZ3ItPmNsa3MucGh5Y2xrX2toeikpIHsKIAkJY2xr
X21nci0+Y2xrcy5waHljbGtfa2h6ID0gbmV3X2Nsb2Nrcy0+cGh5Y2xrX2toejsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
