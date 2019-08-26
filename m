Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28E99D228
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 16:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618996E0D8;
	Mon, 26 Aug 2019 14:58:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FFF6E0D8
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 14:58:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q12so15607397wrj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 07:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=OamF/J373rAukCr454leAWb6hOcngyJoVUu8xEE5gbc=;
 b=Dnq9alpVoRxbAmtsCXy5f6Y7tTDsJN0aYrUSSssMHVr1evkoWD85q4p9n8X/NQRerb
 N2y5U2hg46IAMbCmBeNzip27ESwsHQYjcp0cpH+qypGcoboZZkbr7h8WI5jMeal8f0AX
 mwZahhDiyrOPvZTUbssaj8cc6+YbUP6TmIN6foqKPT4oYcQpCIuaWTFONsIwkhVDMdEs
 HPQ8pDNFKGrY3vSlENdBiC+/UgiYl7oogeQZ4+DT+bY9aopjeiHAg23g/l2acq0elmNX
 pApUHf2fjstPNbFoFnWc5VBt85tSM+C9ytC+94aB43SEK1AZ/YPXpGS9pdUZzDfCcIA+
 AldQ==
X-Gm-Message-State: APjAAAUQLypkLyQaBb1vmFBkWaHgIGYj0A8d3Guhkq81hPPJhOGtwhFk
 J6m9RWBaD05n0UIGzk6d7Yw=
X-Google-Smtp-Source: APXvYqx/kgE+zNYmjcSspZY23Hha+1/EES/knVoLTz9fvEYQk4Zxb3mJkIFQrNNMcnATCr/xN+Hflg==
X-Received: by 2002:adf:e74c:: with SMTP id c12mr22550876wrn.173.1566831512454; 
 Mon, 26 Aug 2019 07:58:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r16sm23766774wrc.81.2019.08.26.07.58.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 07:58:31 -0700 (PDT)
Subject: Re: [PATCH] Revert "drm/amdgpu: free up the first paging queue v2"
To: Gang Ba <gaba@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1566830720-20121-1-git-send-email-gaba@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <534a0417-f3ac-a6d8-021e-d1fe202819f7@gmail.com>
Date: Mon, 26 Aug 2019 16:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566830720-20121-1-git-send-email-gaba@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OamF/J373rAukCr454leAWb6hOcngyJoVUu8xEE5gbc=;
 b=Rx7oyki25mnWVThloSsAvxZFeVGDIMzDeqqZCsiQkrdvx5D4Qw4qqWFvFAg/A4X25B
 5GLRyxmaeNQGmmuZ7RmHTzspAKu/Rh4v9iVM2On1kflhx4tTu2+Yp9or6qTQBiFkdJY/
 KUikH8vunXlxS5/bvchkKzPBE3i1XcgeN2GKCd1eMqNH9AJ/Jdnje8my3yEI/RPDPKOg
 aY+itFuJyraay8qpcpSgCzflBW5gOi67BVmllFUR4YVuxxWg4ELKS1J6XypOVYDbwnN6
 i2WJ9Gl6MG1UuL88yNm7Z0cx2XBV3HD7Iy6S8iSkWuTXSu40Eq6CZqEgfuwUN4G9NELD
 wprw==
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

QW0gMjYuMDguMTkgdW0gMTY6NDUgc2NocmllYiBHYW5nIEJhOgo+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgNGY4YmM3MmZiZjEwZjJkYzhiY2E3NGQ1ZGEwOGIzYTk4MWIyZTVjZC4KPgo+IEl0IHR1cm5l
ZCBvdXQgdGhhdCBhIHNpbmdsZSByZXNlcnZlZCBxdWV1ZSB3b3VsZG4ndCBiZQo+IHN1ZmZpY2ll
bnQgZm9yIHBhZ2UgZmF1bHQgaGFuZGxpbmcuCj4KPiBDaGFuZ2UtSWQ6IEk1NzdiYTIzNmUwNTcx
ZDExNDAwYTUxZjlkOTU4NDAyMzRhZWY2NzhhCj4gU2lnbmVkLW9mZi1ieTogR2FuZyBCYSA8Z2Fi
YUBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYyB8IDIzICsrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jCj4gaW5kZXggYjNiMmMyMS4uNzc1MGIzNyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCj4gQEAgLTI1MDAsOCArMjUwMCw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgYW1kZ3B1X2J1ZmZlcl9mdW5jcyBzZG1hX3Y0XzBfYnVmZmVyX2Z1bmNzID0g
ewo+ICAgc3RhdGljIHZvaWQgc2RtYV92NF8wX3NldF9idWZmZXJfZnVuY3Moc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4gICB7Cj4gICAJYWRldi0+bW1hbi5idWZmZXJfZnVuY3MgPSAmc2Rt
YV92NF8wX2J1ZmZlcl9mdW5jczsKPiAtCWlmIChhZGV2LT5zZG1hLmhhc19wYWdlX3F1ZXVlICYm
IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlcyA+IDEpCj4gLQkJYWRldi0+bW1hbi5idWZmZXJfZnVu
Y3NfcmluZyA9ICZhZGV2LT5zZG1hLmluc3RhbmNlWzFdLnBhZ2U7Cj4gKwlpZiAoYWRldi0+c2Rt
YS5oYXNfcGFnZV9xdWV1ZSkKPiArCQlhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19yaW5nID0gJmFk
ZXYtPnNkbWEuaW5zdGFuY2VbMF0ucGFnZTsKPiAgIAllbHNlCj4gICAJCWFkZXYtPm1tYW4uYnVm
ZmVyX2Z1bmNzX3JpbmcgPSAmYWRldi0+c2RtYS5pbnN0YW5jZVswXS5yaW5nOwo+ICAgfQo+IEBA
IC0yNTIwLDIyICsyNTIwLDE1IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjRfMF9zZXRfdm1fcHRlX2Z1
bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCXVuc2lnbmVkIGk7Cj4gICAKPiAg
IAlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9mdW5jcyA9ICZzZG1hX3Y0XzBfdm1fcHRlX2Z1bmNz
Owo+IC0JaWYgKGFkZXYtPnNkbWEuaGFzX3BhZ2VfcXVldWUgJiYgYWRldi0+c2RtYS5udW1faW5z
dGFuY2VzID4gMSkgewo+IC0JCWZvciAoaSA9IDE7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5j
ZXM7IGkrKykgewo+ICsJZm9yIChpID0gMDsgaSA8IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsg
aSsrKSB7Cj4gKwkJaWYgKGFkZXYtPnNkbWEuaGFzX3BhZ2VfcXVldWUpCj4gICAJCQlzY2hlZCA9
ICZhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnBhZ2Uuc2NoZWQ7Cj4gLQkJCWFkZXYtPnZtX21hbmFn
ZXIudm1fcHRlX3Jxc1tpIC0gMV0gPQo+IC0JCQkJJnNjaGVkLT5zY2hlZF9ycVtEUk1fU0NIRURf
UFJJT1JJVFlfS0VSTkVMXTsKPiAtCQl9Cj4gLQkJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfbnVt
X3JxcyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlcyAtIDE7Cj4gLQkJYWRldi0+dm1fbWFuYWdl
ci5wYWdlX2ZhdWx0ID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbMF0ucGFnZTsKPiAtCX0gZWxzZSB7
Cj4gLQkJZm9yIChpID0gMDsgaSA8IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsgaSsrKSB7Cj4g
KwkJZWxzZQo+ICAgCQkJc2NoZWQgPSAmYWRldi0+c2RtYS5pbnN0YW5jZVtpXS5yaW5nLnNjaGVk
Owo+IC0JCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9ycXNbaV0gPQo+IC0JCQkJJnNjaGVkLT5z
Y2hlZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlfS0VSTkVMXTsKPiAtCQl9Cj4gLQkJYWRldi0+dm1f
bWFuYWdlci52bV9wdGVfbnVtX3JxcyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsKPiArCQlh
ZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9ycXNbaV0gPQo+ICsJCQkmc2NoZWQtPnNjaGVkX3JxW0RS
TV9TQ0hFRF9QUklPUklUWV9LRVJORUxdOwo+ICAgCX0KPiArCWFkZXYtPnZtX21hbmFnZXIudm1f
cHRlX251bV9ycXMgPSBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7Cj4gICB9Cj4gICAKPiAgIGNv
bnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVyc2lvbiBzZG1hX3Y0XzBfaXBfYmxvY2sgPSB7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
