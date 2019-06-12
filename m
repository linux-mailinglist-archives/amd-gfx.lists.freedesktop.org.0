Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A943022
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 21:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E214489155;
	Wed, 12 Jun 2019 19:29:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983D589155
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 19:29:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h19so4963335wme.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 12:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rYNXJR4eUQ5goKlgX7PfteZF3PG2T7yRq3lImE+fIvA=;
 b=JY63sc8nhSKoUXccMfi0VdwRUwojJxLNjhd8LU04nls18CjsmjDoraaMQcQ9vMmnEL
 vhq+N3K8vRmwNPDFwoTDfrwCKPmNhyrn3NIkMxSk+iF1VBii/7TEq2+6hPYmwss65yQo
 ADTciYlRmzldOFzM2N3/tit8SInQkhk8+ONdLeoSoqLA0SUM6/BwKD4wU9NCZoCHdVKY
 OO17LJHQE9Mjf+UjZ9Z3/fmKF8/Uu6TciguQUYWitXV8MI3hdqY+1+EN6lnaP1mPK76f
 6nHwtUEIPV/+EQm4gCut2w1v3IEZ0wCUrBm2WnmIo3HFO5QaLx9C8W0lsPlr544Y9KFY
 o9HA==
X-Gm-Message-State: APjAAAXT1zuKsqmaeHzYPXWFU3ZHxWJpVqjOxGbDnEuFRBDl92n9eb/2
 dF8PGbB3Pq026gXZIlI3uZoGwFRg
X-Google-Smtp-Source: APXvYqyeOWSDkNN2o8JKVIVHP2WQNAUWnfEpuhIu0lWzWyGOy96RTm70FaujuCv2QQDN7yToe8yVXA==
X-Received: by 2002:a1c:6242:: with SMTP id w63mr557056wmb.161.1560367741138; 
 Wed, 12 Jun 2019 12:29:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x129sm398622wmg.44.2019.06.12.12.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 12:29:00 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
To: "Yang, Philip" <Philip.Yang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190612151250.816-1-Philip.Yang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5eae5f5a-73f3-4d6e-2a20-892aed285359@gmail.com>
Date: Wed, 12 Jun 2019 21:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612151250.816-1-Philip.Yang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rYNXJR4eUQ5goKlgX7PfteZF3PG2T7yRq3lImE+fIvA=;
 b=IfSYjMMs923uB0P3J2eMSOrKhL54ljg1jFTVi9GLBbIv+XBan8LG2LdXd44l7dNdiK
 BtOT7jEpyLTOw7207iqamsvumE+Jsdvq+3xF9v/nzPglh2MttR+WEA87QI/XGRzuPATX
 aIb6ckn2PobYXNiSAD7e9YAdGiA++xknzQi/QfypwEgTl3+eVG93JCqAuAD50odTKsLA
 AHDzTN0e8uaFtHpnJ5Xb04IHVXF/tI64yKee7sl9QM///DpttWr4Zet6D9IKNlK5kfiW
 ysPBBzggVVqphAlKAJDs3im4E/UYb5jJE+JaquClAQjuGDRXbbknM17m8C1IuQUoz6jy
 MFOg==
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

QW0gMTIuMDYuMTkgdW0gMTc6MTMgc2NocmllYiBZYW5nLCBQaGlsaXA6Cj4gVFRNIGNyZWF0ZSB0
d28gem9uZXMsIGtlcm5lbCB6b25lIGFuZCBkbWEzMiB6b25lIGZvciBzeXN0ZW0gbWVtb3J5LiBJ
Zgo+IHN5c3RlbSBtZW1vcnkgYWRkcmVzcyBhbGxvY2F0ZWQgaXMgYmVsb3cgNEdCLCB0aGlzIGFj
Y291bnQgdG8gZG1hMzIgem9uZQo+IGFuZCB3aWxsIGV4aGF1c3QgZG1hMzIgem9uZSBhbmQgdHJp
Z2dlciB1bm5lc3NzYXJ5IFRUTSBldmljdGlvbi4KPgo+IFBhdGNoICJkcm0vdHRtOiBBY2NvdW50
IGZvciBrZXJuZWwgYWxsb2NhdGlvbnMgaW4ga2VybmVsIHpvbmUgb25seSIgb25seQo+IGhhbmRs
ZSB0aGUgYWxsb2NhdGlvbiBmb3IgYWNjX3NpemUsIHRoZSBzeXN0ZW0gbWVtb3J5IHBhZ2UgYWxs
b2NhdGlvbiBpcwo+IHRocm91Z2ggdHRtX21lbV9nbG9iYWxfYWxsb2NfcGFnZSB3aGljaCBzdGls
bCBhY2NvdW50IHRvIGRtYTMyIHpvbmUgaWYKPiBwYWdlIGlzIGJlbG93IDRHQi4KCk5BSywgYXMg
dGhlIG5hbWUgc2F5cyB0aGUgbWVtX2dsb2IgaXMgZ2xvYmFsIGZvciBhbGwgZGV2aWNlcyBpbiB0
aGUgc3lzdGVtLgoKU28gdGhpcyB3aWxsIGJyZWFrIGlmIHlvdSBtaXggRE1BMzIgYW5kIG5vbiBE
TUEzMiBpbiB0aGUgc2FtZSBzeXN0ZW0gCndoaWNoIGlzIGV4YWN0bHkgdGhlIGNvbmZpZ3VyYXRp
b24gbXkgbGFwdG9wIGhlcmUgaGFzIDooCgpDaHJpc3RpYW4uCgo+Cj4gQ2hhbmdlLUlkOiBJMjg5
Yjg1ZDg5MWI4ZjY0YTE0MjJjNDJiMWVhYjM5ODA5OGFiN2VmNwo+IFNpZ25lZC1vZmYtYnk6IFBo
aWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4g
aW5kZXggMjc3OGZmNjNkOTdkLi43OWJiOWRmZTYxN2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gQEAgLTE2ODYsNiArMTY4NiwxMCBAQCBpbnQgYW1kZ3B1
X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCX0KPiAgIAlhZGV2LT5t
bWFuLmluaXRpYWxpemVkID0gdHJ1ZTsKPiAgIAo+ICsJLyogT25seSBrZXJuZWwgem9uZSAobm8g
ZG1hMzIgem9uZSkgaWYgZGV2aWNlIGRvZXMgbm90IHJlcXVpcmUgZG1hMzIgKi8KPiArCWlmICgh
YWRldi0+bmVlZF9kbWEzMikKPiArCQlhZGV2LT5tbWFuLmJkZXYuZ2xvYi0+bWVtX2dsb2ItPm51
bV96b25lcyA9IDE7Cj4gKwo+ICAgCS8qIFdlIG9wdCB0byBhdm9pZCBPT00gb24gc3lzdGVtIHBh
Z2VzIGFsbG9jYXRpb25zICovCj4gICAJYWRldi0+bW1hbi5iZGV2Lm5vX3JldHJ5ID0gdHJ1ZTsK
PiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
