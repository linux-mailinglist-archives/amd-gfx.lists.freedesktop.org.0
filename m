Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EC7A4B1
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 11:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F54F6E47D;
	Tue, 30 Jul 2019 09:38:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361066E47C
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 09:38:51 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so61974980edq.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 02:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=EefdNHWrYtJwCvYxO2X4oKN+om/QXAR/JdAkzdzy1gA=;
 b=FgcYfQLNGY4DDSehu+T4kF1FBOJ4lH56h0VIhaxK4fQAdEe6QJWVXPzXAS3BRk8H4v
 brDdxXrVlFlI8Q1T1VpaE+JsgA2ZI8L/JktTeGwEYlO6fXm8BKYNm/PpuMRyjgor+6OE
 xcPT7UGFMMwe/98B5vqM5RSQCLNXGghCLrbqbtq6lR8zfm9dGOjXU2Zi1eBNjW2itYLm
 HEZtY99AC2Zij5LARM40YckN1iFe+BivmCJXuTFCsoBKdqNFG5yh2BCm9mRh/hIwmlT8
 ejaE4g4RwBrFSC9bQsBWMOOz2kfcTKoBMjuf9IaL+EJDfSpXHijf9WLUnfELlfAr1MFs
 VSug==
X-Gm-Message-State: APjAAAVHRgiRw1DmouWPrFpwwr5Jt3ScYCB7iyc768/c/zrkqFjOuj8H
 wyzFN1RlCscV3xZTSFO3Fp0=
X-Google-Smtp-Source: APXvYqyn4NLIltiFICSdTauR29BsneOxfoMQXqPoVuUrgGip3WJWrxh5/Z+mqA8O8wMJZalDymOGog==
X-Received: by 2002:a17:906:68d0:: with SMTP id
 y16mr89171465ejr.161.1564479529757; 
 Tue, 30 Jul 2019 02:38:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w6sm8062592edq.81.2019.07.30.02.38.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 02:38:49 -0700 (PDT)
Date: Tue, 30 Jul 2019 11:38:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [RFC PATCH 0/3] Propose new struct drm_mem_region
Message-ID: <20190730093847.GP15868@phenom.ffwll.local>
References: <20190730003225.322-1-brian.welty@intel.com>
 <951e9e42-96bc-fc8d-0153-3ca7ac5f1e74@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <951e9e42-96bc-fc8d-0153-3ca7ac5f1e74@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=EefdNHWrYtJwCvYxO2X4oKN+om/QXAR/JdAkzdzy1gA=;
 b=gwH04rNoyEdpfPShGdG/H3VGTR8UWIOJ+aQVYGTK8wO20f8PjgD85J4JNusBr7F7Z7
 XwUQaX3ILXcDajNugaISrZcaCtx7fUm050XX1X2osh9880AKSrcJ30tpkTb8gJJ1bNqv
 Js3rVMty1XRPa1qwPsfZ3WOVPsMUzTOJicvaM=
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
Cc: Brian Welty <brian.welty@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NDU6NTdBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gWWVhaCwgdGhhdCBsb29rcyBsaWtlIGEgZ29vZCBzdGFydC4gSnVzdCBhIGNv
dXBsZSBvZiByYW5kb20gZGVzaWduIAo+IGNvbW1lbnRzL3JlcXVpcmVtZW50cy4KPiAKPiBGaXJz
dCBvZiBhbGwgcGxlYXNlIHJlc3RydWN0dXJlIHRoZSBjaGFuZ2VzIHNvIHRoYXQgeW91IG1vcmUg
b3IgbGVzcyAKPiBoYXZlIHRoZSBmb2xsb3dpbmc6Cj4gMS4gQWRkaW5nIG9mIHRoZSBuZXcgc3Ry
dWN0dXJlcyBhbmQgZnVuY3Rpb25hbGl0eSB3aXRob3V0IGFueSBjaGFuZ2UgdG8gCj4gZXhpc3Rp
bmcgY29kZS4KPiAyLiBSZXBsYWNpbmcgdGhlIGV4aXN0aW5nIGZ1bmN0aW9uYWxpdHkgaW4gVFRN
IGFuZCBhbGwgb2YgaXRzIGRyaXZlcnMuCj4gMy4gUmVwbGFjaW5nIHRoZSBleGlzdGluZyBmdW5j
dGlvbmFsaXR5IGluIGk5MTUuCj4gCj4gVGhpcyBzaG91bGQgbWFrZSBpdCBtdWNoIGVhc2llciB0
byByZXZpZXcgdGhlIG5ldyBmdW5jdGlvbmFsaXR5IHdoZW4gaXQgCj4gaXMgbm90IG1peGVkIHdp
dGggZXhpc3RpbmcgVFRNIHN0dWZmLgo+IAo+IAo+IFNlY29uZCBwbGVhc2UgY29tcGxldGVseSBk
cm9wIHRoZSBjb25jZXB0IG9mIGdwdV9vZmZzZXQgb3Igc3RhcnQgb2YgdGhlIAo+IG1lbW9yeSBy
ZWdpb24gbGlrZSBoZXJlOgo+ID4gZHJtX3ByaW50ZihwLCAiICAgIGdwdV9vZmZzZXQ6IDB4JTA4
bGxYXG4iLCBtYW4tPnJlZ2lvbi5zdGFydCk7Cj4gQXQgbGVhc3Qgb24gQU1EIGhhcmR3YXJlIHdl
IGhhdmUgdGhlIGZvbGxvd2luZyBhZGRyZXNzIHNwYWNlcyB3aGljaCBhcmUgCj4gc29tZXRpbWVz
IGV2ZW4gcGFydGlhbGx5IG92ZXJsYXBwaW5nOiBWTSwgTUMsIFNZU1RFTSwgRkIsIEFHUCwgWEdN
SSwgYnVzIAo+IGFkZHJlc3NlcyBhbmQgcGh5c2ljYWwgYWRkcmVzc2VzLgo+IAo+IFB1c2hpbmcg
YSBjb25jZXB0IG9mIGEgZ2VuZXJhbCBHUFUgYWRkcmVzcyBzcGFjZSBpbnRvIHRoZSBtZW1vcnkg
Cj4gbWFuYWdlbWVudCB3YXMgYSByYXRoZXIgYmFkIGRlc2lnbiBtaXN0YWtlIGluIFRUTSBhbmQg
d2Ugc2hvdWxkIG5vdCAKPiByZXBlYXQgdGhhdCBoZXJlLgo+IAo+IEEgcmVnaW9uIHNob3VsZCBv
bmx5IGNvbnNpc3RzIG9mIGEgc2l6ZSBpbiBieXRlcyBhbmQgKGludGVybmFsIHRvIHRoZSAKPiBy
ZWdpb24gbWFuYWdlcikgYWxsb2NhdGlvbnMgaW4gdGhhdCByZWdpb24uCj4gCj4gCj4gVGhpcmQg
cGxlYXNlIGRvbid0IHVzZSBhbnkgQ1BVIG9yIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyB0eXBlcyBp
biBhbnkgCj4gZGF0YSBzdHJ1Y3R1cmVzOgo+ID4gK3N0cnVjdCBkcm1fbWVtX3JlZ2lvbiB7Cj4g
PiArCXJlc291cmNlX3NpemVfdCBzdGFydDsgLyogd2l0aGluIEdQVSBwaHlzaWNhbCBhZGRyZXNz
IHNwYWNlICovCj4gPiArCXJlc291cmNlX3NpemVfdCBpb19zdGFydDsgLyogQkFSIGFkZHJlc3Mg
KENQVSBhY2Nlc3NpYmxlKSAqLwo+ID4gKwlyZXNvdXJjZV9zaXplX3Qgc2l6ZTsKPiAKPiBJIGtu
ZXcgdGhhdCByZXNvdXJjZV9zaXplIGlzIG1vc3RseSA2NGJpdCBvbiBtb2Rlcm4gYXJjaGl0ZWN0
dXJlcywgYnV0IAo+IGRHUFVzIGFyZSBjb21wbGV0ZWx5IHNlcGFyYXRlIHRvIHRoZSBhcmNoaXRl
Y3R1cmUgYW5kIHdlIGFsd2F5cyBuZWVkIAo+IDY0Yml0cyBoZXJlIGF0IGxlYXN0IGZvciBBTUQg
aGFyZHdhcmUuCj4gCj4gU28gdGhpcyBzaG91bGQgZWl0aGVyIGJlIGFsd2F5cyB1aW50NjRfdCwg
b3Igc29tZXRoaW5nIGxpa2UgCj4gZ3B1X3Jlc291cmNlX3NpemUgd2hpY2ggZGVwZW5kcyBvbiB3
aGF0IHRoZSBjb21waWxlZCBpbiBkcml2ZXJzIHJlcXVpcmUgCj4gaWYgd2UgcmVhbGx5IG5lZWQg
dGhhdC4KPiAKPiBBbmQgYnkgdGhlIHdheTogUGxlYXNlIGFsd2F5cyB1c2UgYnl0ZXMgZm9yIHRo
aW5ncyBsaWtlIHNpemVzIGFuZCBub3QgCj4gbnVtYmVyIG9mIHBhZ2VzLCBjYXVzZSBwYWdlIHNp
emUgaXMgYWdhaW4gQ1BVL2FyY2hpdGVjdHVyZSBzcGVjaWZpYyBhbmQgCj4gR1BVIGRyaXZlcnMg
ZG9uJ3QgbmVjZXNzYXJ5IGNhcmUgYWJvdXQgdGhhdC4KPiAKPiAKPiBBbmQgaGVyZSBhbHNvIGEg
ZmV3IGRpcmVjdCBjb21tZW50cyBvbiB0aGUgY29kZToKPiA+ICsJdW5pb24gewo+ID4gKwkJc3Ry
dWN0IGRybV9tbSAqbW07Cj4gPiArCQkvKiBGSVhNRSAoZm9yIGk5MTUpOiBzdHJ1Y3QgZHJtX2J1
ZGR5X21tICpidWRkeV9tbTsgKi8KPiA+ICsJCXZvaWQgKnByaXY7Cj4gPiArCX07Cj4gTWF5YmUg
anVzdCBhbHdheXMgdXNlIHZvaWQgKm1tIGhlcmUuCj4gCj4gPiArCXNwaW5sb2NrX3QgbW92ZV9s
b2NrOwo+ID4gKwlzdHJ1Y3QgZG1hX2ZlbmNlICptb3ZlOwo+IAo+IFRoYXQgaXMgVFRNIHNwZWNp
ZmljIGFuZCBJJ20gbm90IHN1cmUgaWYgd2Ugd2FudCBpdCBpbiB0aGUgY29tbW9uIG1lbW9yeSAK
PiBtYW5hZ2VtZW50IGhhbmRsaW5nLgo+IAo+IElmIHdlIHdhbnQgdGhhdCBoZXJlIHdlIHNob3Vs
ZCBwcm9iYWJseSByZXBsYWNlIHRoZSBsb2NrIHdpdGggc29tZSByY3UgCj4gYW5kIGF0b21pYyBm
ZW5jZSBwb2ludGVyIGV4Y2hhbmdlIGZpcnN0Lgo+IAo+ID4gKy8qCj4gPiArICogTWVtb3J5IHR5
cGVzIGZvciBkcm1fbWVtX3JlZ2lvbgo+ID4gKyAqLwo+IAo+ICNkZWZpbmUgRFJNX01FTV9TV0FQ
wqDCoMKgID8KCmJ0dyB3aGF0IGRpZCB5b3UgaGF2ZSBpbiBtaW5kIGZvciB0aGlzPyBTaW5jZSB3
ZSB1c2Ugc2htZW0gd2Uga2luZGEgZG9uJ3QKa25vdyB3aGV0aGVyIHRoZSBCTyBpcyBhY3R1YWxs
eSBzd2FwcGVkIG91dCBvciBub3QsIGF0IGxlYXN0IG9uIHRoZSBpOTE1CnNpZGUuIFNvIHRoaXMg
d291bGQgYmUgbW9yZSBOT1RfQ1VSUkVOVExZX1BJTk5FRF9BTkRfUE9TU0lCTFlfU1dBUFBFRF9P
VVQuCgo+IFRUTSB3YXMgY2xlYXJseSBtaXNzaW5nIHRoYXQgcmVzdWx0aW5nIGluIGEgd2hvbGUg
YnVuY2ggb2YgZXh0cmEgCj4gaGFuZGxpbmcgYW5kIHJhdGhlciBjb21wbGljYXRlZCBoYW5kbGlu
Zy4KPiAKPiA+ICsjZGVmaW5lIERSTV9NRU1fU1lTVEVNCTAKPiA+ICsjZGVmaW5lIERSTV9NRU1f
U1RPTEVOCTEKPiAKPiBJIHRoaW5rIHdlIG5lZWQgYSBiZXR0ZXIgbmFtaW5nIGZvciB0aGF0Lgo+
IAo+IFNUT0xFTiBzb3VuZHMgd2F5IHRvIG11Y2ggbGlrZSBzdG9sZW4gVlJBTSBmb3IgaW50ZWdy
YXRlZCBHUFVzLCBidXQgYXQgCj4gbGVhc3QgZm9yIFRUTSB0aGlzIGlzIHRoZSBzeXN0ZW0gbWVt
b3J5IGN1cnJlbnRseSBHUFUgYWNjZXNzaWJsZS4KCll1cCB0aGlzIGlzIHdyb25nLCBmb3IgaTkx
NSB3ZSB1c2UgdGhpcyBhcyBzdG9sZW4sIGZvciB0dG0gaXQncyB0aGUgZ3B1CnRyYW5zbGF0aW9u
IHRhYmxlIHdpbmRvdyBpbnRvIHN5c3RlbSBtZW1vcnkuIE5vdCB0aGUgc2FtZSB0aGluZyBhdCBh
bGwuCi1EYW5pZWwKCj4gCj4gCj4gVGhhbmtzIGZvciBsb29raW5nIGludG8gdGhhdCwKPiBDaHJp
c3RpYW4uCj4gCj4gQW0gMzAuMDcuMTkgdW0gMDI6MzIgc2NocmllYiBCcmlhbiBXZWx0eToKPiA+
IFsgQnkgcmVxdWVzdCwgcmVzZW5kaW5nIHRvIGluY2x1ZGUgYW1kLWdmeCArIGludGVsLWdmeC4g
IFNpbmNlIHJlc2VuZGluZywKPiA+ICAgIEkgZml4ZWQgdGhlIG5pdCB3aXRoIG9yZGVyaW5nIG9m
IGhlYWRlciBpbmNsdWRlcyB0aGF0IFNhbSBub3RlZC4gXQo+ID4KPiA+IFRoaXMgUkZDIHNlcmll
cyBpcyBmaXJzdCBpbXBsZW1lbnRhdGlvbiBvZiBzb21lIGlkZWFzIGV4cHJlc3NlZAo+ID4gZWFy
bGllciBvbiBkcmktZGV2ZWwgWzFdLgo+ID4KPiA+IFNvbWUgb2YgdGhlIGdvYWxzIChvcGVuIGZv
ciBtdWNoIGRlYmF0ZSkgYXJlOgo+ID4gICAgLSBDcmVhdGUgY29tbW9uIGJhc2Ugc3RydWN0dXJl
IChzdWJjbGFzcykgZm9yIG1lbW9yeSByZWdpb25zIChwYXRjaCAjMSkKPiA+ICAgIC0gQ3JlYXRl
IGNvbW1vbiBtZW1vcnkgcmVnaW9uIHR5cGVzIChwYXRjaCAjMikKPiA+ICAgIC0gQ3JlYXRlIGNv
bW1vbiBzZXQgb2YgbWVtb3J5X3JlZ2lvbiBmdW5jdGlvbiBjYWxsYmFja3MgKGJhc2VkIG9uCj4g
PiAgICAgIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Z1bmNzIGFuZCBpbnRlbF9tZW1vcnlfcmVnaW9u
c19vcHMpCj4gPiAgICAtIENyZWF0ZSBjb21tb24gaGVscGVycyB0aGF0IG9wZXJhdGUgb24gZHJt
X21lbV9yZWdpb24gdG8gYmUgbGV2ZXJhZ2VkCj4gPiAgICAgIGJ5IGJvdGggVFRNIGRyaXZlcnMg
YW5kIGk5MTUsIHJlZHVjaW5nIGNvZGUgZHVwbGljYXRpb24KPiA+ICAgIC0gQWJvdmUgbWlnaHQg
c3RhcnQgd2l0aCByZWZhY3RvcmluZyB0dG1fYm9fbWFuYWdlci5jIGFzIHRoZXNlIGFyZQo+ID4g
ICAgICBoZWxwZXJzIGZvciB1c2luZyBkcm1fbW0ncyByYW5nZSBhbGxvY2F0b3IgYW5kIGNvdWxk
IGJlIG1hZGUgdG8KPiA+ICAgICAgb3BlcmF0ZSBvbiBEUk0gc3RydWN0dXJlcyBpbnN0ZWFkIG9m
IFRUTSBvbmVzLgo+ID4gICAgLSBMYXJnZXIgZ29hbCBtaWdodCBiZSB0byBtYWtlIExSVSBtYW5h
Z2VtZW50IG9mIEdFTSBvYmplY3RzIGNvbW1vbiwgYW5kCj4gPiAgICAgIG1pZ3JhdGUgdGhvc2Ug
ZmllbGRzIGludG8gZHJtX21lbV9yZWdpb24gYW5kIGRybV9nZW1fb2JqZWN0IHN0cnVjdXJlcy4K
PiA+Cj4gPiBQYXRjaGVzIDEtMiBpbXBsZW1lbnQgdGhlIHByb3Bvc2VkIHN0cnVjdCBkcm1fbWVt
X3JlZ2lvbiBhbmQgYWRkcwo+ID4gYXNzb2NpYXRlZCBjb21tb24gc2V0IG9mIGRlZmluaXRpb25z
IGZvciBtZW1vcnkgcmVnaW9uIHR5cGUuCj4gPgo+ID4gUGF0Y2ggIzMgaXMgdXBkYXRlIHRvIGk5
MTUgYW5kIGlzIGJhc2VkIHVwb24gYW5vdGhlciBzZXJpZXMgd2hpY2ggaXMKPiA+IGluIHByb2dy
ZXNzIHRvIGFkZCB2cmFtIHN1cHBvcnQgdG8gaTkxNSBbMl0uCj4gPgo+ID4gWzFdIGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUvMjI0NTAx
Lmh0bWwKPiA+IFsyXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9pbnRl
bC1nZngvMjAxOS1KdW5lLzIwMzY0OS5odG1sCj4gPgo+ID4gQnJpYW4gV2VsdHkgKDMpOgo+ID4g
ICAgZHJtOiBpbnRyb2R1Y2UgbmV3IHN0cnVjdCBkcm1fbWVtX3JlZ2lvbgo+ID4gICAgZHJtOiBJ
bnRyb2R1Y2UgRFJNX01FTSBkZWZpbmVzIGZvciBzcGVjaWZ5aW5nIHR5cGUgb2YgZHJtX21lbV9y
ZWdpb24KPiA+ICAgIGRybS9pOTE1OiBVcGRhdGUgaW50ZWxfbWVtb3J5X3JlZ2lvbiB0byB1c2Ug
bmVzdGVkIGRybV9tZW1fcmVnaW9uCj4gPgo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fb2JqZWN0LmMgICAgfCAgMiArLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fc2htZW0uYyAgICAgfCAgMiArLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2dlbV9ndHQuYyAgICAgICAgICAgfCAxMCArKy0tLQo+ID4gICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2dwdV9lcnJvci5jICAgICAgICAgfCAgMiArLQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMgICAgICAgICAgICAgfCAgMiArLQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pbnRlbF9tZW1vcnlfcmVnaW9uLmMgICAgfCAxMCArKystLQo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9tZW1vcnlfcmVnaW9uLmggICAgfCAxOSArKystLS0t
LS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcmVnaW9uX2xtZW0uYyAgICAgIHwg
MjYgKysrKysrLS0tLS0tLQo+ID4gICAuLi4vZHJtL2k5MTUvc2VsZnRlc3RzL2ludGVsX21lbW9y
eV9yZWdpb24uYyAgfCAgOCArKy0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMg
ICAgICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKy0tLS0tLS0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jICAgICAgICAgIHwgMTQgKysrLS0tLQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgICAgICAgICAgICAgfCAxMSArKystLS0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZ21yaWRfbWFuYWdlci5jIHwgIDggKyst
LQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgICAgfCAg
NCArLQo+ID4gICBpbmNsdWRlL2RybS9kcm1fbW0uaCAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAzOSArKysrKysrKysrKysrKysrKystCj4gPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBp
LmggICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9f
ZHJpdmVyLmggICAgICAgICAgICAgICB8IDE2ICsrKystLS0tCj4gPiAgIGluY2x1ZGUvZHJtL3R0
bS90dG1fcGxhY2VtZW50LmggICAgICAgICAgICAgICB8ICA4ICsrLS0KPiA+ICAgMTggZmlsZXMg
Y2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKyksIDkzIGRlbGV0aW9ucygtKQo+ID4KPiAKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
