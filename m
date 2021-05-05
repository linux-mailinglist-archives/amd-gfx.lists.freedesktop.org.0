Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51651373505
	for <lists+amd-gfx@lfdr.de>; Wed,  5 May 2021 08:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3366E252;
	Wed,  5 May 2021 06:39:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7C26E252
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 May 2021 06:39:20 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id d14so586831edc.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 May 2021 23:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=40qmrj+Fkf9UmO+O6G7GsprglZ4ntuNidGNAMBKyD3s=;
 b=SQq7hs8gCU1N1uFHUfg6QyUEBM8/wDLknM35D82qVgmP+ZdWmu2JrBzETkqI5kR4/i
 NQ8eMGstsIbb5Oe6xfFq9JOoY+VrHZmL06ExthAItKbt/HbHEAvVvJ9nzIItAAvdkARM
 liV/tFfZIlX53YNiJsTJBEHxt28WhurK95GU56VYe4sHn7XuPpXhihCZTSTl5yIKYbnV
 Fh03xLIibdV3GYjyBnFs4qkvv+6KLHt35s/4yeUVXDU12VRY58auxhYECJbroMEhXggI
 dXtpTUKSx+JKgRTHeoP1TWEpu/yazYnhfj8zAbGEVfR0/jz5yQoHhpCLZoV52eDGfO6o
 5EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=40qmrj+Fkf9UmO+O6G7GsprglZ4ntuNidGNAMBKyD3s=;
 b=bxmeKGT49ATrTvvS5lGU4nMzNJ/zMCgI9m3/6xkoVa1opo9iWrYAV33CcZm1+B4Ea2
 C5IyLF0PmMNHqU/kPT77QIj/F0BDINFev0Cy4JP/0ftsXI3AsLrEOtnOwtMoY1FijIZi
 pjrOVYgCNijpAB3RA1X/1Mo7rk6woCHT30+CfKhO3Ft5JKCGRH6IbfC0X5D6Ce8t6EZ4
 BnFFbtuA1MkEqv7/q/Lh3N/aaRnkwiQVV/3LDiDQH3vAhKVVVy6N3RJLXwYNvqA9/83f
 pY05VQLPZMb6eC0QfriGXq53Uc6xIO6kGN4cU8xXqYEb5kmhduaw99HSPh+m4tBMYtJ3
 8DZg==
X-Gm-Message-State: AOAM531PFVU4fuHwthjuN7nPH8g8DAGNJL8oJefi0jggWwkWYFGpnqWd
 XLmQYExxTGA65HB3WztoJJc=
X-Google-Smtp-Source: ABdhPJyIfvxxmybRjWK4UyRUgkB+3n7skjDsorG1GteJ8HOQjz0UzQm7E5510twZj8KuNM3AUCiwng==
X-Received: by 2002:aa7:dad7:: with SMTP id x23mr30765789eds.86.1620196759342; 
 Tue, 04 May 2021 23:39:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:53b:b55a:337a:bf10?
 ([2a02:908:1252:fb60:53b:b55a:337a:bf10])
 by smtp.gmail.com with ESMTPSA id n15sm2472229eje.118.2021.05.04.23.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 23:39:18 -0700 (PDT)
Subject: Re: [PATCH 0/4] Normalize redundant variables
To: Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210504214756.3816-1-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c05d4983-bcb5-e735-171a-fb878c448124@gmail.com>
Date: Wed, 5 May 2021 08:39:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210504214756.3816-1-luben.tuikov@amd.com>
Content-Language: en-US
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 John Clements <john.clements@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9y
IHRoZSBzZXJpZXMuCgpBbSAwNC4wNS4yMSB1bSAyMzo0NyBzY2hyaWViIEx1YmVuIFR1aWtvdjoK
PiBDbGFzc2ljIG5vcm1hbGl6YXRpb24gb2YgYSByZWR1bmRhbnQgdmFyaWFibGUuCj4gVGhlcmUg
aXMgbm8gbmVlZCB0byBoYXZlIHR3byB2YXJpYWJsZXMgcmVwcmVzZW50aW5nCj4gdGhlIHNhbWUg
cXVhbnRpdHkuIE1vdmUgdXAgdG8gdGhlIHN0cnVjdHVyZSB3aGljaAo+IHJlcHJlc2VudHMgdGhl
IG9iamVjdCB3aGljaCBkZXRlcm1pbmVzIHRoZWlyIHZhbHVlcy4KPiBSZW5hbWUgdG8gYSBjb25z
aXN0ZW50IG5hbWUsIGFuZCBleHBvcnQgdG8gZGVidWdmcwo+IGZvciBkZWJ1Z2dpbmcuCj4KPiBM
dWJlbiBUdWlrb3YgKDQpOgo+ICAgIGRybS9hbWRncHU6IFJlbW92ZSByZWR1bmRhbnQgcmFzLT5z
dXBwb3J0ZWQKPiAgICBkcm0vYW1kZ3B1OiBNb3ZlIHVwIHJhc19od19zdXBwb3J0ZWQKPiAgICBk
cm0vYW1kZ3B1OiBSZW5hbWUgdG8gcmFzXypfZW5hYmxlZAo+ICAgIGRybS9hbWRncHU6IEV4cG9y
dCByYXNfKl9lbmFibGVkIHRvIGRlYnVnZnMKPgo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmggICAgICAgICAgIHwgIDMgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyAgICB8ICA2ICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfa21zLmMgICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyAgICAgICB8IDkxICsrKysrKysrKy0tLS0tLS0tLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgICAgICB8ICA1ICstCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgICAgICAgfCAgMiArLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAgICAgIHwgIDcgKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jICAgICB8ICA2ICstCj4g
ICAuLi4vZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2JhY28uYyAgfCAgMiArLQo+
ICAgLi4uL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3NtdV92MTFfMC5jICAgIHwgIDMgKy0K
PiAgIDExIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQo+
Cj4gQ2M6IEFsZXhhbmRlciBEZXVjaGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPgo+IENj
OiBKb2huIENsZW1lbnRzIDxqb2huLmNsZW1lbnRzQGFtZC5jb20+Cj4gQ2M6IEhhd2tpbmcgWmhh
bmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
