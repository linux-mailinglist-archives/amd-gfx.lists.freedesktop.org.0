Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D31084BE
	for <lists+amd-gfx@lfdr.de>; Sun, 24 Nov 2019 20:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365689B69;
	Sun, 24 Nov 2019 19:19:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3281089B69
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 19:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9E222D7D2CF7C
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 13:19:52 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AnsHF5qey95V for <amd-gfx@lists.freedesktop.org>;
 Sun, 24 Nov 2019 13:19:52 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2ABAAD7D2CF79
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 13:19:52 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2ABAAD7D2CF79
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3C6dovv6ngYk for <amd-gfx@lists.freedesktop.org>;
 Sun, 24 Nov 2019 13:19:52 -0600 (CST)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 069CFD7D2CF76
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 13:19:52 -0600 (CST)
Date: Sun, 24 Nov 2019 13:19:51 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: amd-gfx <amd-gfx@lists.freedesktop.org>
Message-ID: <724747252.1925748.1574623191962.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <443989900.1923547.1574622652551.JavaMail.zimbra@raptorengineeringinc.com>
References: <443989900.1923547.1574622652551.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH 1/1] amdgpu: Enable KFD on POWER systems
MIME-Version: 1.0
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC73 (Linux)/8.5.0_GA_3042)
Thread-Topic: amdgpu: Enable KFD on POWER systems
Thread-Index: DvSodV0VNNA5bM53SIuKWIAdogdWuEOFxgZS
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1574623192; bh=3v8aMI0gB0IRmgtkiLTPN0CbqGg7lLMKsQm2sD8X4Xo=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=N9A1C8yfQdjpjLJAAFRHDtkpgjIbBHC3C23GzZsRCnr2EpBMWDLAe9FzA7smsZBj8
 qJk2xGdODQOLfTj1jEDHPdKpdHHwBxslIDV3nF3q31NqJgNnNIVUJY4gKoEgcZKXez
 QeHd5Z4YCSKhJz63Ug3nSiMcdKNtybDx6MAVIXFo=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U29ycnkgZm9yIHRoZSBzcGFtIC0tIEkgaGFkIHRob3VnaHQgSSB3YXMgc2lnbmVkIHVwIGZvciB0
aGlzIGxpc3QgYnV0IGFwcGFyZW50bHkgd2FzIG5vdCwgYW5kIHJlc2VudCBhIGNvdXBsZSB0aW1l
cy4KCi0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBGcm9tOiAiVGltb3RoeSBQZWFyc29u
IiA8dHBlYXJzb25AcmFwdG9yZW5naW5lZXJpbmcuY29tPgo+IFRvOiAiYW1kLWdmeCIgPGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgo+IFNlbnQ6IFN1bmRheSwgTm92ZW1iZXIgMjQsIDIw
MTkgMToxMDo1MiBQTQo+IFN1YmplY3Q6IFtQQVRDSCAxLzFdIGFtZGdwdTogRW5hYmxlIEtGRCBv
biBQT1dFUiBzeXN0ZW1zCgo+IEtGRCBoYXMgYmVlbiB2ZXJpZmllZCB0byBmdW5jdGlvbiBvbiBQ
T1dFUiBzeXN0ZW1zIChUYWxvcyBJSSAvIFZlZ2EgNjQpLgo+IEl0IHNob3VsZCBiZSBhdmFpbGFi
bGUgYXMgYSBrZXJuZWwgY29uZmlndXJhdGlvbiBvcHRpb24gb24gdGhlc2Ugc3lzdGVtcy4KPiAt
LS0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9LY29uZmlnIHwgMiArLQo+IDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9LY29uZmlnCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9LY29uZmlnCj4gaW5kZXggYTFhMzVkNGQ1OTRiLi5iYTBlNjgwNTdhODkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL0tjb25maWcKPiBAQCAtNSw3ICs1LDcgQEAKPiAKPiBjb25m
aWcgSFNBX0FNRAo+IAlib29sICJIU0Ega2VybmVsIGRyaXZlciBmb3IgQU1EIEdQVSBkZXZpY2Vz
Igo+IC0JZGVwZW5kcyBvbiBEUk1fQU1ER1BVICYmIChYODZfNjQgfHwgQVJNNjQpCj4gKwlkZXBl
bmRzIG9uIERSTV9BTURHUFUgJiYgKFg4Nl82NCB8fCBBUk02NCB8fCBQUEM2NCkKPiAJaW1wbHkg
QU1EX0lPTU1VX1YyIGlmIFg4Nl82NAo+IAlzZWxlY3QgTU1VX05PVElGSUVSCj4gCWhlbHAKPiAt
LQo+IDIuMjAuMQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
