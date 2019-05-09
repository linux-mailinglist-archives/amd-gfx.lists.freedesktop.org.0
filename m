Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E75B18858
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 12:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA61899E7;
	Thu,  9 May 2019 10:30:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDAA89A91
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 10:30:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o189so2607096wmb.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 May 2019 03:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l8yzGzRr5wWXndK3iDigrsu6+yOr9j8Q5agtMSamJRE=;
 b=O2eoaAYuFvzuezeW/a7z1hzNV5MrxY6gDfXJ55T6ZZybJkYA/0F1BnAPMJvPnsgC2d
 ixI7FkbpKgCx0zYfTOx6y6eQ3efMw6uIkB5dVJXOh71PA/WZBYE5/MO5mXv2X7kzMFtD
 Q/tiL5QJZfp+L0QUfW1BgWJueSijBBa6j7vUXlRcM13nsPg/ztyIxe2h9aWr2Eqje8fR
 TXOstZf6aV7ZZB/5GyttgMCn6LcvHlqwBsoZyhk+41FA756pyoLIvFSvanO2ymgJpPoK
 QLyxP9jSaVVZNCHsnWcG8uSnW3Mgz0Oen5psazIjpqnIpRsUkN8WkT0Ll+uL2XQ1TZcP
 eGeA==
X-Gm-Message-State: APjAAAUo6OPllseS1JiubVgl3yKWCDfXl33ve9ZFfJ0XofmiK8/pblCl
 m7nh75zIpaCXm4cq5Ox66OMHx25L
X-Google-Smtp-Source: APXvYqyBsKKhlukdrQQ3DjyKr4pFpJ0ouAudVLqcBXxsQ0LvEcLXkEsPLcHOMJK9XXRr7VsPxFyO5Q==
X-Received: by 2002:a1c:9e04:: with SMTP id h4mr2431459wme.135.1557397799727; 
 Thu, 09 May 2019 03:29:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j10sm6560105wrb.0.2019.05.09.03.29.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 03:29:59 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: fix the duplicated TMO message for one IB
To: "Liu, Monk" <Monk.Liu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1557376305-24294-1-git-send-email-Monk.Liu@amd.com>
 <ca57f69d-eced-8e9d-5a07-42a642d96a0f@gmail.com>
 <BYAPR12MB3301677254798D131BC7E8FB84330@BYAPR12MB3301.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4b0c90d0-6535-9942-e140-666a4c0ff4b7@gmail.com>
Date: Thu, 9 May 2019 12:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB3301677254798D131BC7E8FB84330@BYAPR12MB3301.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l8yzGzRr5wWXndK3iDigrsu6+yOr9j8Q5agtMSamJRE=;
 b=Z5csfgLZzAFJdyEFgOAT5i35b9nwBWS9Xd8G4jIrgrPK9G7MjTGOc6IlktION2k92s
 g7Qn/wN6/Rr9vRTj31BteBTEo1CsL2O65CLhwH3CdJiO2lqwm6ZkmwspNdLLuKLYtzWt
 7eUN07iaQcRGpb8ceER+p9dyumncP9iktYUhmawmS17/DD2XFCqplnkYnJQbT1IF3IAy
 TaQHjQO2omDxww1Pr2krhZhbfG4+LQjs+T2OaXMrT6a3EtqjmysBDg6w3GyVHINx6Diq
 2b5DdaznME7pkxl9bvKPFee6r7VXfWCptO7/gmw5KNctmOKnWBC+bgoEFoQJBCDatWmK
 EgFw==
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

ZHJtX3NjaGVkX3N0YXJ0KCkgaXMgbm90IG5lY2Vzc2FyeSBjYWxsZWQgZnJvbSB0aGUgdGltZW91
dCBoYW5kbGVyLgoKSWYgYSBzb2Z0IHJlY292ZXJ5IGlzIHN1ZmZpY2llbnQsIHdlIGp1c3QgY29u
dGludWUgd2l0aG91dCBhIGNvbXBsZXRlIHJlc2V0LgoKQ2hyaXN0aWFuLgoKQW0gMDkuMDUuMTkg
dW0gMTI6MjUgc2NocmllYiBMaXUsIE1vbms6Cj4gQ2hyaXN0aWFuCj4KPiBDaGVjayAiZHJtX3Nj
aGVkX3N0YXJ0IiB3aGljaCBpcyBpbnZva2VkIGZyb20gZ3B1X3JlY292ZXIoKSAsIHRoZXJlIGlz
IGEgImRybV9zY2hlZF9zdGFydF90aW1lb3V0KCkiIGluIHRoZSB0YWlsCj4KPiAvTW9uawo+Cj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29l
bmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPiBTZW50OiBUaHVyc2RheSwgTWF5IDksIDIw
MTkgMzoxOCBQTQo+IFRvOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9zY2hlZDogZml4
IHRoZSBkdXBsaWNhdGVkIFRNTyBtZXNzYWdlIGZvciBvbmUgSUIKPgo+IFtDQVVUSU9OOiBFeHRl
cm5hbCBFbWFpbF0KPgo+IEFtIDA5LjA1LjE5IHVtIDA2OjMxIHNjaHJpZWIgTW9uayBMaXU6Cj4+
IHdlIGRvbid0IG5lZWQgZHVwbGljYXRlZCBJQidzIHRpbWVvdXQgZXJyb3IgbWVzc2FnZSByZXBv
cnRlZAo+PiBlbmRsZXNzbHksIGp1c3Qgb25lIHJlcG9ydCBwZXIgdGltZWRvdXQgSUIgaXMgZW5v
dWdoCj4gV2VsbCwgTkFLLiBXZSBkb24ndCBuZWVkIG11bHRpcGxlIHRpbWVvdXQgcmVwb3J0cywg
YnV0IHdlIHJlYWxseSBuZWVkIHRvIHJlc3RhcnQgdGhlIHRpbWVvdXQgY291bnRlciBhZnRlciBo
YW5kbGluZyBpdC4KPgo+IE90aGVyd2lzZSB3ZSB3aWxsIG5ldmVyIHJ1biBpbnRvIGEgdGltZW91
dCBhZ2FpbiBhZnRlciBoYW5kbGluZyBvbmUgYW5kIGl0IGlzbid0IHVubGlrZWx5IHRoYXQgbXVs
dGlwbGUgSUJzIGluIGEgcm93IGRvZXNuJ3Qgd29yayBjb3JyZWN0bHkuCj4KPiBDaHJpc3RpYW4u
Cj4KPj4gU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+Cj4+IC0tLQo+
PiAgICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDUgLS0tLS0KPj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+IGluZGV4IGMxYWFmODUuLmQ2YzE3ZjEgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+IEBAIC0zMDgsNyArMzA4LDYg
QEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KndvcmspCj4+ICAgIHsKPj4gICAgICAgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQ7
Cj4+ICAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iOwo+PiAtICAgICB1bnNpZ25lZCBs
b25nIGZsYWdzOwo+Pgo+PiAgICAgICAgc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0
IGRybV9ncHVfc2NoZWR1bGVyLCB3b3JrX3Rkci53b3JrKTsKPj4gICAgICAgIGpvYiA9IGxpc3Rf
Zmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsCj4+IEBAIC0zMTYs
MTAgKzMxNSw2IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0Cj4+
IHdvcmtfc3RydWN0ICp3b3JrKQo+Pgo+PiAgICAgICAgaWYgKGpvYikKPj4gICAgICAgICAgICAg
ICAgam9iLT5zY2hlZC0+b3BzLT50aW1lZG91dF9qb2Ioam9iKTsKPj4gLQo+PiAtICAgICBzcGlu
X2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKPj4gLSAgICAgZHJt
X3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOwo+PiAtICAgICBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+PiAgICB9Cj4+Cj4+ICAgICAvKioK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
