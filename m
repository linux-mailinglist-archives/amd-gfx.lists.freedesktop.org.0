Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8237D37
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 21:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999AF898A4;
	Thu,  6 Jun 2019 19:27:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD2B8989F
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 19:20:03 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id u12so4054028qth.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 12:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NOvZLPRSrzGWhPhtd8eWwTAdoG6UOPdllDEIeYGVWVY=;
 b=ToR7ju+H9FV/Zm31jScNros2rIqYuBjutocdylBxnOeM/iwt+UYFr+OSsI9jgTpBzt
 iack/gA/AasOf75xWqifEdKzBOQB5HZYudqFg9nMHC/pjQJio/TP2QiWANgocxr/0+Sf
 E/nkCTPb2Nz7rgAMjtqo4VwaI3JildLmy0d9ye06XZBOB58RSEJCvhWyUvU73wsI7JkH
 gK6OPoGfS4RUPiNr398luHAjv16IO/FFxaf8oQSzaq8JavjUd8DeZFhCTisFwTV16Oo0
 AC8Y4GSt5F19dZLaI7ESHoJD20o4rD3mVE51XADZxi/FaoWZXkXBrkksBcELKBMC2KyI
 HznA==
X-Gm-Message-State: APjAAAWC73fdSecVln4WXTWiztuwUGABj3BJF8BU7kkltNdA/lpN/rby
 loHCmpHv/YbUgRSvyVt0zhZ8LQ==
X-Google-Smtp-Source: APXvYqyxYoNhsdYVBBxjYNi54BLNBE5mbbC0g0zhB9xE8cJnmhy61aNq31c4sszODb5OeOKktoDvVA==
X-Received: by 2002:a0c:b095:: with SMTP id o21mr12310027qvc.73.1559848802623; 
 Thu, 06 Jun 2019 12:20:02 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id a11sm13209qkn.26.2019.06.06.12.20.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 12:20:01 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxvd-0008WS-Ew; Thu, 06 Jun 2019 16:20:01 -0300
Date: Thu, 6 Jun 2019 16:20:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 0/2] Two bug-fixes for HMM
Message-ID: <20190606192001.GE17373@ziepe.ca>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190606151149.GA5506@ziepe.ca>
 <1d309300-41d8-eb31-38c2-c6c9dd5c0ba8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d309300-41d8-eb31-38c2-c6c9dd5c0ba8@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 06 Jun 2019 19:27:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NOvZLPRSrzGWhPhtd8eWwTAdoG6UOPdllDEIeYGVWVY=;
 b=Go+h0QnnbPbmbQnaHLoeVDVfIeog+XU4T/7TDtX4Srl9uVBh+7+iupfn9qMIilwXnJ
 QD6DfGl4m7HDtXQfWSl+2Bg9kX/Mj+fUzCOhJVKNK1l6SJOqD+4a0MesPwpeZ9jVym2M
 ZukM+UEQ2DoBQqS8aFwKMRS/UyLpudOplbAsjTb8XBZNkciK7qUPL38Egl4YT7FZxWhg
 ktmOeD2UiTIbD7Vy40kegb6Fgix+8J39uqPzpRtGNHYbin8QxIXY27pwkj/vlXzC3xFs
 AVtQAI1EyiO2prRqha0arX4q7pAVcyZU401kmc4b/OhezyWoChXH933z9Z9+dGnsrME5
 ptOw==
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
Cc: "alex.deucher@amd.com" <alex.deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDc6MDQ6NDZQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IE9uIDIwMTktMDYtMDYgMTE6MTEgYS5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Ogo+ID4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDc6NTM6MjFQTSArMDAwMCwgS3VlaGxpbmcs
IEZlbGl4IHdyb3RlOgo+ID4+IFRoZXNlIHByb2JsZW1zIHdlcmUgZm91bmQgaW4gQU1ELWludGVy
bmFsIHRlc3RpbmcgYXMgd2UncmUgd29ya2luZyBvbgo+ID4+IGFkb3B0aW5nIEhNTS4gVGhleSBh
cmUgcmViYXNlZCBhZ2FpbnN0IGdsaXNzZS9obW0tNS4yLXYzLiBXZSdkIGxpa2UgdG8gZ2V0Cj4g
Pj4gdGhlbSBhcHBsaWVkIHRvIGEgbWFpbmxpbmUgTGludXgga2VybmVsIGFzIHdlbGwgYXMgZHJt
LW5leHQgYW5kCj4gPj4gYW1kLXN0YWdpbmctZHJtLW5leHQgc29vbmVyIHJhdGhlciB0aGFuIGxh
dGVyLgo+ID4+Cj4gPj4gQ3VycmVudGx5IHRoZSBITU0gaW4gYW1kLXN0YWdpbmctZHJtLW5leHQg
aXMgcXVpdGUgZmFyIGJlaGluZCBobW0tNS4yLXYzLAo+ID4+IGJ1dCB0aGUgZHJpdmVyIGNoYW5n
ZXMgZm9yIEhNTSBhcmUgZXhwZWN0ZWQgdG8gbGFuZCBpbiA1LjIgYW5kIHdpbGwgbmVlZCB0bwo+
ID4+IGJlIHJlYmFzZWQgb24gdGhvc2UgSE1NIGNoYW5nZXMuCj4gPj4KPiA+PiBJJ2QgbGlrZSB0
byB3b3JrIG91dCBhIGZsb3cgYmV0d2VlbiBKZXJvbWUsIERhdmUsIEFsZXggYW5kIG15c2VsZiB0
aGF0Cj4gPj4gYWxsb3dzIHVzIHRvIHRlc3QgdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIEhNTSBvbiBh
bWQtc3RhZ2luZy1kcm0tbmV4dCBzbwo+ID4+IHRoYXQgaWRlYWxseSBldmVyeXRoaW5nIGNvbWVz
IHRvZ2V0aGVyIGluIG1hc3RlciB3aXRob3V0IG11Y2ggbmVlZCBmb3IKPiA+PiByZWJhc2luZyBh
bmQgcmV0ZXN0aW5nLgo+ID4gSSB0aGluayB3ZSBoYXZlIHRoYXQgbm93LCBJJ20gcnVubmluZyBh
IGhtbS5naXQgdGhhdCBpcyBjbGVhbiBhbmQgY2FuCj4gPiBiZSB1c2VkIGZvciBtZXJnaW5nIGlu
dG8gRFJNIHJlbGF0ZWQgdHJlZXMgKGFuZCBSRE1BKS4gSSd2ZSBjb21taXRlZAo+ID4gdG8gc2Vu
ZCB0aGlzIHRyZWUgdG8gTGludXMgYXQgdGhlIHN0YXJ0IG9mIHRoZSBtZXJnZSB3aW5kb3cuCj4g
Pgo+ID4gU2VlIGhlcmU6Cj4gPgo+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MTkwNTI0MTI0NDU1LkdCMTY4NDVAemllcGUuY2EvCj4gPgo+ID4gVGhlIHRyZWUgaXMgaGVyZToK
PiA+Cj4gPiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3JkbWEvcmRtYS5naXQvbG9nLz9oPWhtbQo+ID4KPiA+IEhvd2V2ZXIgcGxlYXNlIGNvbnN1bHQg
d2l0aCBtZSBiZWZvcmUgbWFraW5nIGEgbWVyZ2UgY29tbWl0IHRvIGJlCj4gPiBjby1vcmRpbmF0
ZWQuIFRoYW5rcwo+ID4KPiA+IEkgc2VlIGluIHRoaXMgdGhyZWFkIHRoYXQgQU1ER1BVIG1pc3Nl
ZCA1LjIgYmVhY2F1c2Ugb2YgdGhlCj4gPiBjby1vcmRpbmF0aW9uIHByb2JsZW1zIHRoaXMgdHJl
ZSBpcyBpbnRlbmRlZCB0byBzb2x2ZSwgc28gSSdtIHZlcnkKPiA+IGhvcGVmdWwgdGhpcyB3aWxs
IGhlbHAgeW91ciB3b3JrIG1vdmUgaW50byA1LjMhCj4gCj4gVGhhbmtzIEphc29uLiBPdXIgdHdv
IHBhdGNoZXMgYmVsb3cgd2VyZSBhbHJlYWR5IGluY2x1ZGVkIGluIHRoZSBNTSB0cmVlIAo+ICho
dHRwczovL296bGFicy5vcmcvfmFrcG0vbW1vdHMvYnJva2VuLW91dC8pLiBXaXRoIHlvdXIgbmV3
IGhtbS5naXQsIAo+IGRvZXMgdGhhdCBtZWFuIEhNTSBmaXhlcyBhbmQgY2hhbmdlcyB3aWxsIG5v
IGxvbmdlciBnbyB0aHJvdWdoIEFuZHJldyAKPiBNb3J0b24gYnV0IGRpcmVjdGx5IHRocm91Z2gg
eW91ciB0cmVlIHRvIExpbnVzPwoKSSBiZWxpdmUgc28sIHRoYXQgaXMgd2hhdCB3ZSBhZ3JlZWQg
dG8gaW4gdGhlIFJGQy4gQXQgbGVhc3QgZm9yIHRoaXMKY3ljbGUuCgpJIGFscmVhZHkgbm90aWNl
ZCB0aGUgZHVwbGljYXRpb24gYW5kIHNlbnQgQW5kcmV3IGEgc2VwYXJhdGUgbm90ZS4uCgpJdCB3
aWxsIGJlIGJlc3QgaWYgbW9zdCBvZiB0aGUgdGhpbmdzIHRvdWNoaW5nIG1tL2htbS5jIGdvIHRv
IGhtbS5naXQKdG8gYXZvaWQgY29uZmxpY3RzIGZvciBMaW51cy4KCj4gV2UgaGF2ZSBhbHNvIGFw
cGxpZWQgdGhlIHR3byBwYXRjaGVzIHRvIG91ciBpbnRlcm5hbCB0cmVlIHdoaWNoIGlzIAo+IGN1
cnJlbnRseSBiYXNlZCBvbiA1LjItcmMxIHNvIHdlIGNhbiBtYWtlIHByb2dyZXNzLgoKTWFrZXMg
c2Vuc2UsIHRoaXMgaXMgaXMgYWxzbyB3aHkgdGhpcyBzaGFyZWQgdHJlZSBzaG91bGQgYmUgdmVy
eQpoZWxwZnVsLi4KCkkgaW50ZW5kIHRvIHJ1biBpdCBhcyBhIGNsZWFuIGFuZCBzdGFibGUgbm9u
LXJlYmFzaW5nIHRyZWUsIGFoCnByb2JhYmx5IHN0YXJ0aW5nIHRvbW9ycm93IHNpbmNlIEkgc2Vl
IHRoZXJlIGlzIHN0aWxsIGFub3RoZXIKZml4dXAuIDopCgo+IEFsZXgsIEkgdGhpbmsgbWVyZ2lu
ZyBobW0gd291bGQgYmUgYW4gZXh0cmEgc3RlcCBldmVyeSB0aW1lIHlvdSByZWJhc2UKPiBhbWQt
c3RhZ2luZy1kcm0tbmV4dC4gV2UgY291bGQgcHJvYmFibHkgYWxzbyBtZXJnZSBobW0gYXQgb3Ro
ZXIgdGltZXMgYXMKPiBuZWVkZWQuIERvIHlvdSB0aGluayB0aGlzIHdvdWxkIGNhdXNlIHRyb3Vi
bGUgb3IgY29uZnVzaW9uIGZvciAKPiB1cHN0cmVhbWluZyB0aHJvdWdoIGRybS1uZXh0PwoKSSdt
IG5vdCBzdXJlIHdoYXQgdGhlIHdvcmtmbG93IHRoZSBhbWQgdHJlZSB1c2VzLCBidXQuLgoKQnJv
YWRseTogSWYgdGhlIEFNRCB0cmVlIGlzIHJlYmFzaW5nIHRoZW4gbGlrZWx5IHlvdSBjYW4gc2lt
cGx5IHJlYmFzZQp5b3VyIEFNRCB0cmVlIG9uIHRvcCBvZiBobW0uZ2l0IChvciBtYXliZSBobW0u
Z2l0IG1lcmdlJ2QgaW50bwpEUk0pLgoKTW9zdCBsaWtlbHkgd2Ugd2lsbCB3YW50IHRvIHNlbmQg
YSBQUiBmb3IgaG1tLmdpdCB0byBtYWluIERSTSB0cmVlCnByaW9yIHRvIG1lcmdpbmcgQU1EJ3Mg
dHJlZSwgYnV0IEknbSBhbHNvIHJhdGhlciByZWx5aW5nIG9uIERSTSBmb2xrcwp0byBoZWxwIGJ1
aWxkIHRoZSB3b3JrZmxvdyB0aGV5IHdhbnQgaW4gdGhlaXIgd29ybGQuLgoKVGhlcmUgYXJlIHF1
aXRlIGEgZmV3IG9wdGlvbnMgZGVwZW5kaW5nIG9uIHBlb3BsZSdzIHByZWZlcmVuY2VzIGFuZAp3
b3JrZmxvdy4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
