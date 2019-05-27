Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7232B662
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 15:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3A76E1BE;
	Mon, 27 May 2019 13:26:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FCE6E1BD
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 13:26:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id j12so26725227eds.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 06:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=U8rW6b65ncIrMrfnWKOt9gP8gI9ZFUaBoLNkEW7zY3M=;
 b=hml+5LYCt5YOHTJ3PWTnv2VhifF0C5A2V6BlDYcTPXyS+MznNyISvIzyhIWfvbei0i
 PetP3yU80hP+VLmRMJzlSy+Mar5s3cOSfOzrH0Vah8k2xd2Gm0gkQodCI4L1tzp5iYQ7
 4PUuu6yjNq4c1dIPEihHiT6Y+7VARLr7Z+r6lVrcDH/zmHxy4p9g5d7JfeHIn/joYv9S
 H7mLPxg+asv22wFDEATWQ4t4Tas9xMdXP+TGHkzASsUGMLBjyE8BYtVz5TgWwFUZdJe0
 egVOtM5//ACE7F4m1tlkbtUHonjGPnA4bFmrgDLt+mmOWsFDFAhznto+xF3YWN0zNUdl
 wAdw==
X-Gm-Message-State: APjAAAUc71MZXQy0E2qs0YFeAQ0DjOV47ZsC9lZcAomXj6ggi/EYY6W6
 hHfqgJivVX2548n6fa1ZjkHQSQ==
X-Google-Smtp-Source: APXvYqz/QgCfx1xVj7jioZqlsJTKZemyvIkPRNIOYfjXpyJJP3rva0RNN6qNmNEek3Z4rSwJVZoegw==
X-Received: by 2002:a17:906:3455:: with SMTP id
 d21mr53649666ejb.66.1558963605094; 
 Mon, 27 May 2019 06:26:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h2sm1720451ejj.42.2019.05.27.06.26.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 06:26:43 -0700 (PDT)
Date: Mon, 27 May 2019 15:26:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190527132641.GQ21222@phenom.ffwll.local>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527120554.GB15067@arch-x1c3>
 <6e8cd288-b53f-fa75-f12b-db939eebb23e@amd.com>
 <20190527125205.GE15067@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527125205.GE15067@arch-x1c3>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U8rW6b65ncIrMrfnWKOt9gP8gI9ZFUaBoLNkEW7zY3M=;
 b=E+7iEqE3JaTPN8HEzWWJ+/BYjLuVOf6Xs+H2rcevloFFyMd0Ty8LOuvybTnYaV4a6c
 eyERpX5MVLHbJN5KME/FN58Qe7eWgj2jBvLsyqul3hoe1TWiFBVDNjqcQtRubSIYcT1A
 b6LrJlTL8RHELPf09Wu3azDEFQoTNYQCTAOuw=
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
Cc: David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDE6NTI6MDVQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIDIwMTkvMDUvMjcsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+ID4gQW0gMjcu
MDUuMTkgdW0gMTQ6MDUgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiA+IE9uIDIwMTkvMDUvMjcs
IEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+ID4gPj4gQW0gMjcuMDUuMTkgdW0gMTA6MTcgc2No
cmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiA+Pj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlr
b3ZAY29sbGFib3JhLmNvbT4KPiA+ID4+Pgo+ID4gPj4+IEN1cnJlbnRseSBvbmUgY2FuIGNpcmN1
bXZlbnQgRFJNX0FVVEgsIHdoZW4gdGhlIGlvY3RsIGlzIGV4cG9zZWQgdmlhIHRoZQo+ID4gPj4+
IHJlbmRlciBub2RlLiBBIHNlZW1pbmdseSBkZWxpYmVyYXRlIGRlc2lnbiBkZWNpc2lvbi4KPiA+
ID4+Pgo+ID4gPj4+IEhlbmNlIHdlIGNhbiBkcm9wIHRoZSBEUk1fQVVUSCBhbGwgdG9nZXRoZXIg
KGRldGFpbHMgaW4gZm9sbG93LXVwIHBhdGNoKQo+ID4gPj4+IHlldCBub3QgYWxsIHVzZXJzcGFj
ZSBjaGVja3MgaWYgaXQncyBhdXRoZW50aWNhdGVkLCBidXQgaW5zdGVhZCB1c2VzCj4gPiA+Pj4g
dW5jb21tb24gYXNzdW1wdGlvbnMuCj4gPiA+Pj4KPiA+ID4+PiBBZnRlciBkYXlzIG9mIGRpZ2dp
bmcgdGhyb3VnaCBnaXQgbG9nIGFuZCB0ZXN0aW5nLCBvbmx5IGEgZWluZ2xlIChhYil1c2UKPiA+
ID4+PiB3YXMgc3BvdHRlZCAtIHRoZSBNZXNhIFJBRFYgZHJpdmVyLCB1c2luZyB0aGUgQU1ER1BV
X0lORk8gaW9jdGwgYW5kCj4gPiA+Pj4gYXNzdW1pbmcgdGhhdCBmYWlsdXJlIGltcGxpZXMgbGFj
ayBvZiBhdXRoZW50aWNhdGlvbi4KPiA+ID4+Pgo+ID4gPj4+IEFmZmVjdGVkIHZlcnNpb25zIGFy
ZToKPiA+ID4+PiAgICAtIHRoZSB3aG9sZSAxOC4yLnggc2VyaWVzLCB3aGljaCBpcyBFT0wKPiA+
ID4+PiAgICAtIHRoZSB3aG9sZSAxOC4zLnggc2VyaWVzLCB3aGljaCBpcyBFT0wKPiA+ID4+PiAg
ICAtIHRoZSAxOS4wLnggc2VyaWVzLCBwcmlvciB0byAxOS4wLjQKPiA+ID4+IFdlbGwgeW91IGNv
dWxkIGhhdmUgc2F2ZWQgeW91ciB0aW1lLCBjYXVzZSB0aGlzIGlzIHN0aWxsIGEgTkFLLgo+ID4g
Pj4KPiA+ID4gRGlkIEkgbWVudGlvbiB0aGF0IEkndmUgc3BlbnQgcXVpdGUgYSBiaXQgb2YgdGlt
ZSBpbiBBTURWTEs/IEV2ZW4gZml4ZWQKPiA+ID4gYSBidWcgd2hpbGUgSSB3YXMgdGhlcmUgOi0p
Cj4gPiAKPiA+IFllYWgsIHRoYW5rcyBmb3IgZG9pbmcgdGhpcy4KPiA+IAo+ID4gQnV0IHdlIGhh
dmUgZG9uZSBzbyBtdWNoIHN0dWZmIHdpdGggY3VzdG9tZXJzIHdoaWNoIGNhbid0IGJlIGF1ZGl0
ZWQgCj4gPiB0aGlzIHdheSwgdGhhdCBJIHN0aWxsIGhhdmUgYSByZWFsbHkgYmFkIGZlZWxpbmcg
YWJvdXQgdGhpcyA6Lwo+ID4gCj4gRmFpciBwb2ludCwgSSd2ZSBhbHJlYWR5IHRob3VnaHQgYWJv
dXQgdGhvc2UuCj4gCj4gRXhhbXBsZSBBOiAgY3VzdG9tZXIgWCwgdXNpbmcgY2xvc2VkIHNvdXJj
ZS9wcml2YXRlIHNvZnR3YXJlIFkuCj4gSW9jdGxzIEEsIEIgYW5kIEMgcmVxdWlyZSB0aGUgb2xk
IGJlaGF2aW91ciAtIHNpbXBseSBhZGQgRk9SQ0VfQVVUSCB0bwo+IHRoZSBBIEIgQyBhbmQgY2Fy
cnkgb24gaGFwcGlseS4KCkhtLCBpZiB0aGUgZW50aXJlIGNvbmNlcm4gaGVyZSBpcyBhbGwgdGhl
IGJhemlsbGlvbiBkaWZmZXJlbnQgdmVyc2lvbnMgb2YKYmxvYnMgc2hpcHBlZCBpbiB0aGUgcGFz
dCBmZXcgeWVhcnMsIHdoeSBjYW4ndCB3ZSBqdXN0IGhhdmUgYSByZXZlcnQgb2YKdGhpcyBpbiB0
aGUgYW1kZ3B1IERLTVM/IE5vdCBsaWtlIG9uZSBtb3JlIHBhdGNoIGFtb25nIHRoZSBodW5kcmVz
IHdpbGwKbWF0dGVyLiBJJ2Qgc3VzcGVjdCB0aGF0IHRoZSBvdmVybGFwIG9mIHBlb3BsZSB3YW50
aW5nIHRvIHJ1biB0aGUgYmxvYnMKYW5kIHBlb3BsZSB3aG8gZG9uJ3QgcnVuIHRoZSBES01TIG9y
IHNpbWlsYXIgaXMgcm91Z2hseSAwLiBBbHdheXMgYmVlbiB0aGUKY2FzZSBoZXJlIGF0IEludGVs
IGF0IGxlYXN0LgoKSWYgdGhlcmUncyBvdGhlciBzdHVmZiB0aGF0IHdlIG5lZWQgdG8gYXVkaXQg
KGxpa2Ugcm9jbSBvciB3aGF0ZXZlciksIHRoZW4Kd2Ugc2hvdWxkIGxvb2sgaW50byB0aG9zZSBv
ZmMuCi1EYW5pZWwKCgo+IAo+IEV4YW1wbGUgQjogdGhlIHRlYW0sIGFzIGEgd2hvbGUgdGhpbmtz
IHRoYXQgdGhpcyB3aWxsIGJlIHByb2JsZW1hdGljIGZvcgo+IGN1c3RvbWVyIFggLSBhZGQgRk9S
Q0VfQVVUSCB0byBhbGwgaW9jdGxzIGFuZCBjYXJyeSBvbi4KPiAKPiBJIGRvIHNlZSBhbmQgdW5k
ZXJzdGFuZCB3aHkgYW55b25lIGNhbiBiZSBoZXNpdGFudCBhYm91dCB0aGUgc2VyaWVzLgo+IAo+
IElNSE8gdGhlIGFib3ZlIGV4YW1wbGVzLCBpbGx1c3RyYXRlIHF1aXRlIHJlYXNvbmFibGUgY29t
cHJvbWlzZSBiZXR3ZWVuCj4gb3Blbi1zb3VyY2UgYW5kIGNsb3NlZC1zb3VyY2UvcHJpdmF0ZSBz
b2x1dGlvbnMuCj4gCj4gRG9uJ3QgeW91IGFncmVlPwo+IAo+ID4gPj4gRm9yIHRoZSByZWNvcmQ6
IEkgc3Ryb25nbHkgdGhpbmsgdGhhdCB3ZSBkb24ndCB3YW50IHRvIGV4cG9zZSBhbnkgcmVuZGVy
Cj4gPiA+PiBmdW5jdGlvbmFsaXR5IG9uIHRoZSBwcmltYXJ5IG5vZGUuCj4gPiA+Pgo+ID4gPj4g
VG8gZXZlbiBnbyBhIHN0ZXAgZnVydGhlciBJIHdvdWxkIHNheSB0aGF0IGF0IGxlYXN0IG9uIEFN
RCBoYXJkd2FyZSB3ZQo+ID4gPj4gc2hvdWxkIGNvbXBsZXRlbHkgZGlzYWJsZSBEUkkyIGZvciBv
bmUgb2YgdGhlIG5leHQgZ2VuZXJhdGlvbnMuCj4gPiA+Pgo+ID4gPiBJdCdzIGRvYWJsZSBhbmQg
b3ZlcmFsbCBwcmV0dHkgbmVhdCBpZGVhLgo+ID4gPgo+ID4gPiBUaGVyZSBpcyBhIGNvbnNlcm4g
dGhhdCB0aGlzIGFwcHJvYWNoIG1heSBjYXVzZSBmYXIgbW9yZSByZWdyZXNzaW9ucwo+ID4gPiB0
aGF0IHRoaXMgc2VyaWVzLiBXZSBhcmUgdGFsa2luZyBhYm91dCB5ZWFycyB3b3J0aCBvZiBNZXNh
IGRyaXZlcnMgKGV0Cj4gPiA+IGFsKSB0aGF0IGRlcGVuZCBvbiByZW5kZXIgZnVuY3Rpb25hbGl0
eSBleHBvc2VkIHZpYSB0aGUgcHJpbWFyeSBub2RlLgo+ID4gCj4gPiBZZWFoLCB0aGF0J3MgSSdt
IHBlcmZlY3RseSBhd2FyZSBvZi4gSXQncyB0aGUgcmVhc29uIHdoeSBJIHNhaWQgd2UgCj4gPiBz
aG91bGQgb25seSBkbyBpdCBmb3IgbmV3IGhhcmR3YXJlIGdlbmVyYXRpb25zLgo+ID4gCj4gPiBC
dXQgYXQgc29tZSBwb2ludCBJIHRoaW5rIHdlIHNob3VsZCBkbyB0aGlzIGFuZCBnZXQgcmlkIG9m
IAo+ID4gYXV0aGVudGljYXRpb24vZmxpbmsvRFJJMi8uLi4uCj4gPiAKPiBGd2l3IEkgc2hhcmUg
YSBzaW1pbGFyIHNlbnRpbWVudC4gSWYgeW91J3ZlIGxvb2tlZCB0aHJvdWdoIHRoZSBzZXJpZXMs
Cj4gdGhpcyBpcyBlZmZlY3RpdmVseSBzdGVwIDEsIHRvd2FyZHMgbnVraW5nIERSTV9BVVRIIDot
KQo+IAo+ID4gPiBJJ20gT0sgd2l0aCB3cml0aW5nIHRoZSBwYXRjaGVzLCBidXQgaXQnbGwgYmUg
dXAtdG8gdGhlIEFNREdQVSB0ZWFtIHRvCj4gPiA+IGZvbGxvdy11cCB3aXRoIGFueSByZWdyZXNz
aW9ucy4gQXJlIHlvdSBvayB3aXRoIHRoYXQ/Cj4gPiAKPiA+IEFzIGxvbmcgYXMgd2UgaGF2ZSBh
IGNoZWNrIGxpa2UgYWRldi0+ZmFtaWx5X2lkID4gCj4gPiBXSEFURVZFUl9JU19USEVfQ1VSUkVO
VF9MQVRFU1RfVVBTVFJFQU1fSFcsIEkgdGhpbmsgd2UgYXJlIGZpbmUgd2l0aCB0aGF0Lgo+ID4g
Cj4gPiBJZiBJIHVuZGVyc3Rvb2QgTWljaGVsIGNvcnJlY3RseSB4Zjg2LXZpZGVvLWFtZGdwdSBz
aG91bGQgd29yaywgYnV0IAo+ID4gbW9kZXNldCBtaWdodCBicmVhayBhbmQgbmVlZHMgYSBwYXRj
aC4KPiA+IAo+IFVubGVzcyBJIGhhdmUgY29uY3JldGUgV0hBVEVWRVJfSVNfVEhFLi4uIEkgY2Fu
bm90IGRvIG11Y2ggaGVyZSA6LSgKPiAKPiAKPiBUaGFua3MKPiBFbWlsCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
