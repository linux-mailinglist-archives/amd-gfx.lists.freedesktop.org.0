Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82AA97D23
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 16:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804936E329;
	Wed, 21 Aug 2019 14:35:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856D06E329
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 14:35:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q12so2247707wrj.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 07:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=QFUN8K1O/gsWGcWhMecBBkBPEyLzhb+obA2f54YTbaQ=;
 b=bpbekAtttpMow6xbvZj+YKq1VjcjNNkjpK7LVmbymEAAhGo6R7QbdzlDePvU0Oc6bB
 1kqlVHmNYwExDpYOUOK5QPwK9wpLeaJpvvPzoOTSz5HWE1EEBLzbzX7B1w8uYVQD8cqs
 MBkEkLXqgdCJQRE+OZpbcCFdFSMcILRgVcU+WB0MZFT1pt79i/9CWWD0MedUNSu2ohz+
 tnidFiKbQX1Joitx0Ce4pqmw15YS++UCUKohYLhCaoD1woJIlmV48x7pN+5lzijogEZx
 RUDrOGVvspD5oMN5GzrM40rBwhqZIqMgESu5TIUde0VSSCuJQVYE+HUtW1o4w3/blz+o
 C0mg==
X-Gm-Message-State: APjAAAVXLRXj5HPopKTdhwWhIet1GPOXzUA0IUAg7jZraK+iI7WAaRNz
 Ay1Qzi+y6BiqMIQABbDXyMs=
X-Google-Smtp-Source: APXvYqwBaqWwBB/GOOJl0mnN1R2O73PBwVY5jxlhbwVNODNqQcx0/LczWKvT2X6OlesdOAKQNSWiUw==
X-Received: by 2002:adf:b60c:: with SMTP id f12mr15171503wre.231.1566398137180; 
 Wed, 21 Aug 2019 07:35:37 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o9sm33503311wrm.88.2019.08.21.07.35.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 07:35:36 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: Modify sdma instance number
To: Gang Ba <gaba@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1566397966-4357-1-git-send-email-gaba@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c96fd6ee-eafa-95ab-bdbe-16bbf807f93c@gmail.com>
Date: Wed, 21 Aug 2019 16:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566397966-4357-1-git-send-email-gaba@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QFUN8K1O/gsWGcWhMecBBkBPEyLzhb+obA2f54YTbaQ=;
 b=qZyxYK1fJCY1DgOLPGMVe5GDipWbMBmIVGtc27QiBzH27wKIDqvRKi1+ncj6gQMuhc
 a598cUPRQvi3Ug2XbH34VMrr0BijHwoLveoheTg2JrLDPtHP2Rw/hSLEUxYhDpi8jnDw
 748kHjxV7QIhcQe/WSdB6Y939e2OmNToLOWEUJs4C/KaMkbiL1dleXm656oawDsZXe5B
 TRPS+yDvraU9veCeMFgIVWO+mHeFSrg4cD686YRQySgwX6DIhpDXiRjPMrvBshiyBlx1
 u41Iov8LKtRCxnD1AwrJFKloNHZhWG6TL0XZVD6uxJO4PhW/YanCVhG4YIpvTWoIeoxf
 /PRA==
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjEuMDguMTkgdW0gMTY6MzIgc2NocmllYiBHYW5nIEJhOgo+IFRvIHVwZ3JhZGUgcGVyZm9y
bWFuY2UgaW4gc21hbGwgYmFyIG1vZGUsIHNldCBzZG1hIGJ1ZmZlciBmdW5jdGlvbgo+IHJpbmcg
YW5kIHB0ZSBmdW5jdGlvbiByaW5nIHRvIHVzZSBkaWZmZXJlbnQgaW5zdGFuY2UuCgpOQUssIHdl
IGludGVudGlvbmFsbHkgcmVzZXJ2ZWQgdGhlIGZpcnN0IHBhZ2luZyBxdWV1ZSBoZXJlLgoKSSB3
YW50ZWQgdG8gcmV2ZXJ0IHRoYXQgYXMgd2VsbCwgYnV0IGluIHRoaXMgY2FzZSB5b3Ugd291bGQg
bmVlZCB0byAKcmV2ZXJ0IHRoZSB3aG9sZSBwYXRjaCBhbmQgbm90IGp1c3QgdGhpcyBjaGFuZ2Uu
CgpKdXN0IGxvb2sgZm9yIHRoZSBwYXRjaCBhZGRpbmcgdGhhdCBsaW5lIGFuZCBjb21wbGV0ZWx5
IHJldmVydCBpdCBpbnN0ZWFkLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IENoYW5nZS1JZDog
SWRhNjM3NzkxNGViNjhhMTg4Zjc0NWU2MzQwOWYzNDRmMGNlMWE4YzQKPiBTaWduZWQtb2ZmLWJ5
OiBHYW5nIEJhIDxnYWJhQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMK
PiBpbmRleCAwNzFkNmM5Li41YWNhOWJiNGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3Y0XzAuYwo+IEBAIC0yNTAwLDcgKzI1MDAsNyBAQCBzdGF0aWMgdm9pZCBzZG1hX3Y0
XzBfc2V0X2J1ZmZlcl9mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsKPiAg
IAlhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcyA9ICZzZG1hX3Y0XzBfYnVmZmVyX2Z1bmNzOwo+ICAg
CWlmIChhZGV2LT5zZG1hLmhhc19wYWdlX3F1ZXVlICYmIGFkZXYtPnNkbWEubnVtX2luc3RhbmNl
cyA+IDEpCj4gLQkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfcmluZyA9ICZhZGV2LT5zZG1hLmlu
c3RhbmNlWzFdLnBhZ2U7Cj4gKwkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfcmluZyA9ICZhZGV2
LT5zZG1hLmluc3RhbmNlWzBdLnBhZ2U7Cj4gICAJZWxzZQo+ICAgCQlhZGV2LT5tbWFuLmJ1ZmZl
cl9mdW5jc19yaW5nID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbMF0ucmluZzsKPiAgIH0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
