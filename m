Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5687B13EC3
	for <lists+amd-gfx@lfdr.de>; Sun,  5 May 2019 12:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980B6894C5;
	Sun,  5 May 2019 10:19:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEF3894C5
 for <amd-gfx@lists.freedesktop.org>; Sun,  5 May 2019 10:19:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so13368270wrr.13
 for <amd-gfx@lists.freedesktop.org>; Sun, 05 May 2019 03:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Boai2uBBJk6fCx8HfGZDHwrjmNq0j/gKddx3/TJeCj4=;
 b=EQpR88EKsf14DDHUxXVFS95qm+g7SrH1gRWQwH045S0P/VX35fKki3P1Jw0aCi8/Sa
 62T1SEbYvIFphfYnIafjbWQM2e4tkY8j6X7hZLHyYTl2TAryx1250jFNpK84QlMqFF6q
 oVL3X1ealL7kgbR8+KRFe6Rx3sMGK0HCNB21Xb/FJ8HM45e4H6o9X2sJhTjoDaHj/geP
 E/1i+DazGVDkU0ShgU7HXUdWuy199LaKa0x7a1CU8+cR/arkZs6mAoO6lfzkGrJf9fuy
 hnlexpApwBUmfQS+dgwyfJmqrCIZYnMWhuBCnTeyFoDCw84UGBjcCMMnOd2Zq0svdkn9
 ss6Q==
X-Gm-Message-State: APjAAAVxXfG6IImaZXPncQm1PBbev3pyiKROMHReE/2JDMFf1jIc/3Bj
 QyqrVy1uLTJ6OJOMgcS7zOG/1AyD
X-Google-Smtp-Source: APXvYqwI8F02HZ/w/91aIxvL7G3Mvx0SgkT9HhLgCp1GD7ALzs8WGfAxX+FuLOodZDStaQ8CJfyHUg==
X-Received: by 2002:a5d:4a4f:: with SMTP id v15mr13464651wrs.5.1557051539420; 
 Sun, 05 May 2019 03:18:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q2sm8608250wrd.48.2019.05.05.03.18.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 May 2019 03:18:58 -0700 (PDT)
Subject: Re: How to dump gfx and waves after GPU reset happened?
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
 <98231ce0-f29c-df52-1ba3-c9f85a76bcac@gmail.com>
 <CABXGCsOXEWS5fUrQZQf0qdH6Wn=h5BC9cPaoQk8hYhvW-nm6AA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <58827d68-cc9a-4a37-f078-7aec9b6a98cd@gmail.com>
Date: Sun, 5 May 2019 12:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABXGCsOXEWS5fUrQZQf0qdH6Wn=h5BC9cPaoQk8hYhvW-nm6AA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Boai2uBBJk6fCx8HfGZDHwrjmNq0j/gKddx3/TJeCj4=;
 b=bOyGVUSK/WhjcsFLiu29RDv3B1FSlUON31T/yYYhkar4UO/q0YUvpm1+qSnzMnceRU
 EaBDLU3BLX1ik28ue76YFcyPPUQrpzt4FtVBPQptf0cVSSF9V9zqMyqraT6WIuiSyqeP
 CpT88fhusgZfT5pGXzVmMnYM3zmZ6q2Vctox/eCnmU77bv44c6vwXJbOqhFRqkABm9fH
 0jw2m5MrMpt9aDeTGLZG9X6W5wxWCvJ4DLiAhKHVBsHqqrFMeVmPEMhu80mLXW+2JNNP
 httsTLSbLhNMZdgLJ4AhHyONach9YAsbCntkaD6wJEUg9xnbh6kuKzj3Eu1XFLewvvTe
 xsCQ==
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
Cc: Tom St Denis <tom.stdenis@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDQuMDUuMTkgdW0gMTI6NTEgc2NocmllYiBNaWtoYWlsIEdhdnJpbG92Ogo+IE9uIFNhdCwg
NCBNYXkgMjAxOSBhdCAxMjozMywgQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEhpIE1pa2hhaWwsCj4+Cj4+IHdlbGwgc2hvcnQg
YW5zd2VyIGlzIG5vdCBhdCBhbGwgOikKPj4KPj4gQWZ0ZXIgdGhlIEdQVSByZXNldCBoYXBwZW5l
ZCBhbGwgd2F2ZXMgc2hvdWxkIGJlIGdvbmUgYW5kIHRoZSBnZnggYmxvY2sKPj4gaW4gYSBjbGVh
biBzdGF0ZSBhZ2Fpbi4KPj4KPj4gV2hhdCB5b3UgbmVlZCB0byBkbyBpcyB0byBkaXNhYmxlIGF1
dG9tYXRpYyByZXNldCBieSBzZXR0aW5nCj4+IGFtZGdwdS5sb2NrdXBfdGltZW91dD0tMSBvbiB0
aGUga2VybmVsIGNvbW1hbmQgbGluZSBhbmQgdGhlbiBpbnNwZWN0IHRoZQo+PiBzeXN0ZW0gb3Zl
ciBzc2guCj4+Cj4gVGhpcyBpcyBub3QgY29udmVuaWVudCwgYmVjYXVzZToKPiAtIHJlcXVpcmVz
IGFuIGFkZGl0aW9uYWwgY29tcHV0ZXIuCj4gLSBhZnRlciB0aGUgR1BVIGZyZWV6ZXMsIHRoZSBj
aGFuY2VzIG9mIGNvcnJlY3RseSByZXN0YXJ0aW5nIHRoZQo+IGNvbXB1dGVyIHRlbmQgdG8gemVy
by4KPiBGb3IgbWUsIGFzIGEgYnVnIGh1bnRlciwgaXQgd291bGQgYmUgbW9yZSBjb252ZW5pZW50
IGlmIGFsbCB0aGUgZHVtcHMKPiB3ZXJlIGF1dG9tYXRpY2FsbHkgZHJvcHBlZCBiZWZvcmUgcmVz
ZXR0aW5nIHRoZSBHUFUgdG8gc3BlY2lmaWVkCj4gZGlyZWN0b3J5LgoKWWVhaCwgYnV0IGZvciBt
b3N0IGVuZCB1c2VycyB3ZSBuZWVkIHRvIGdldCB0aGUgR1BVIHdvcmtpbmcgYXMgZmFzdCBhcyAK
cG9zc2libGUgb24gYSBsb2NrdXAuCgpTYXZpbmcgYWxsIHRoZSBzdGF0ZSAod2hpY2ggYWN0dWFs
bHkgY2FuIGJlIGEgY291cGxlIG9mIGdpZ2FieXRlcyBpZiB5b3UgCmluY2x1ZGUgYWxsIHRleHR1
cmVzIGV0Yy4uKSBpcyBub3QgcmVhbGx5IGFuIG9wdGlvbiB0aGVuLgoKV2hhdCB3ZSBjb3VsZCBw
cm9iYWJseSBkbyByYXRoZXIgZWFzaWx5IGlzIHRvIGFkZCBhIGZ1bmN0aW9uIHRvIHJ1biBhIApz
Y3JpcHQgaW5zdGVhZCBvZiBhIEdQVSByZXNldCBvbiBsb2NrdXAgZGV0ZWN0aW9uLgoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKPgo+IEJ1dCB0aGFua3MgYW55d2F5Lgo+IEhlcmUgaXMgYSBuZXcgYnVn
IHJlcG9ydDogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEw
NjA1Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcywKPiBNaWtlIEdhdnJpbG92Lgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
