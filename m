Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F039D1A3
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A98D89DA9;
	Mon, 26 Aug 2019 14:28:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA7F89DA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 14:28:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k1so15709719wmi.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 07:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jNvjRjuSrwgMBTUkqVbMq3HIXAHKOAT36RiuE53fOes=;
 b=YmljARCHYAFtD8Yh++x3gKOK4nlDpc920qJ+OT7iT6uuJP5ZbVxqDOlp7/KHNbttZE
 MZMFIovXuwwEdDgL4huCv4OU8JYGniWttTYyGMjbJLhYy6goX3KGdbg/8nRQsPC9ZF1T
 Uu2yAqaWtBAKCOg15gU6NoB97xOSXpkeLKqQb1qoe5Hnzxs4t3hfgOTr2yk0g8WVxRJw
 VAGlFS5R5P2uFCLHOJ+MOa05P4TzfaZGKNCpL8zrdduUjGrt7iT0VKsiqIm0pxAlbCP3
 iFmL4FsS5NeyNmp4jlJSe8sJanNug8mLBwseBwpL193en5TxPcOmDu0hUCuUfAThZxhE
 mznA==
X-Gm-Message-State: APjAAAXUxPj++Bsy6XYOVBkuxDMucBRLNSC1YSpMNe40TVUih3TAqiAL
 DJLmEHUpDCBkTx9km7L9bs6uGf+X
X-Google-Smtp-Source: APXvYqx5F4xWRrUZtQ5nK1yzjb+yBFQpG+KHWldTzVsKUgAgC6/007SrxplgoMAFFYqCq5mREB/aGA==
X-Received: by 2002:a05:600c:552:: with SMTP id
 k18mr20967140wmc.59.1566829678724; 
 Mon, 26 Aug 2019 07:27:58 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z1sm14904815wrp.51.2019.08.26.07.27.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 07:27:58 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/display: Fix error message
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1566829009-6929-1-git-send-email-andrey.grodzovsky@amd.com>
 <56ada989-630e-a50e-e5a8-728944531b30@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0406db57-c441-f2b5-bb9e-a46dab334416@gmail.com>
Date: Mon, 26 Aug 2019 16:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <56ada989-630e-a50e-e5a8-728944531b30@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jNvjRjuSrwgMBTUkqVbMq3HIXAHKOAT36RiuE53fOes=;
 b=hUS5nNlc1lzxDQYgVtnP5WliYsObspGmwLwN/dIifnlQ3SkZLaEcHKloaKocjHGMsA
 RgU7HqgP/ld8S+yw52nhQ1fUVvCLvWVEcucBAutL/oEknKfj9sF0tAASIDHs04c9vYrq
 Gir4jAhOPRT9NjYBdtnFTlPEvPvAyABQmIoxYHudAbpaWAL9y+n7msIS8JfFWqxYuQqB
 u7OAGGiyV5wZI6jn8OBsaz8GxgfkTn31QbubTMdRF4/gGwFQoKt6cL1V/Bh0RcOkLO+O
 4WKgNo1mKm7Z3ycNfN+xiRm09aIZZFPf4yIqqJ70M6xfqr5PAZ9B3uPExFNG5QVRfIPA
 Ewog==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjYuMDguMTkgdW0gMTY6MTkgc2NocmllYiBLYXpsYXVza2FzLCBOaWNob2xhczoKPiBPbiA4
LzI2LzE5IDEwOjE2IEFNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4gU2luY2UgcmVzZXJ2
YXRpb25fb2JqZWN0X3dhaXRfdGltZW91dF9yY3UgaXMgY2FsbGVkIHdpdGgKPj4gaW50ZXJydXB0
YWJsZSBzZXQgdG8gZmFsc2UgaXQncyB3cm9uZyB0byBzYXkKPj4gJ29yIGludGVycnVwdGVkJyBp
biB0aGUgZXJyb3IgbWVzc2FnZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEth
emxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+Cj4+IC0tLQo+PiAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArLQo+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
Cj4+IGluZGV4IDkzZjY0NDYuLmRhM2Q3NjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+PiBAQCAtNTY4NSw3ICs1Njg1
LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2NvbW1pdF9wbGFuZXMoc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKnN0YXRlLAo+PiAgICAJCQkJCQkJZmFsc2UsCj4+ICAgIAkJCQkJCQltc2Vjc190
b19qaWZmaWVzKDUwMDApKTsKPj4gICAgCQlpZiAodW5saWtlbHkociA8PSAwKSkKPj4gLQkJCURS
TV9FUlJPUigiV2FpdGluZyBmb3IgZmVuY2VzIHRpbWVkIG91dCBvciBpbnRlcnJ1cHRlZCEiKTsK
Pj4gKwkJCURSTV9FUlJPUigiV2FpdGluZyBmb3IgZmVuY2VzIHRpbWVkIG91dCEiKTsKPj4gICAg
Cj4+ICAgIAkJLyoKPj4gICAgCQkgKiBUT0RPIFRoaXMgbWlnaHQgZmFpbCBhbmQgaGVuY2UgYmV0
dGVyIG5vdCB1c2VkLCB3YWl0Cj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
