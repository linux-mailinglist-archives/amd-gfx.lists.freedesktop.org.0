Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C0E6E22
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Oct 2019 09:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BA86E49F;
	Mon, 28 Oct 2019 08:24:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00AD897E0
 for <amd-gfx@lists.freedesktop.org>; Sat, 26 Oct 2019 08:00:35 +0000 (UTC)
Received: from localhost (unknown [89.205.133.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFAB22084C;
 Sat, 26 Oct 2019 08:00:34 +0000 (UTC)
Date: Sat, 26 Oct 2019 10:00:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] drm/radeon: Fix EEH during kexec
Message-ID: <20191026080032.GA554748@kroah.com>
References: <1572036050-18945-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572036050-18945-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:24:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572076835;
 bh=YXMQf5PUTMkCC2s+CE+39AbzWTqptkOht2Sq57tjNEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwXBsxUR/7gmBK7NOUOjgaueLmoNE2diYy8YjeJgqoNIWycx6QKzpjKEuEqojwrqC
 Nr1pI/y9R1CAP2/Zl9Sa7kINANKmqdzvWoXP3sKFNRl6H1C3RAgnzvKO+Y6lNIKHi3
 jN7ECHpWhVJ5gS2cvFgmQWhbw23OHszHhFfgHg00=
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDM6NDA6NTBQTSAtMDUwMCwgS3lsZU1haGxrdWNoIHdy
b3RlOgo+IEZyb206IEt5bGUgTWFobGt1Y2ggPGttYWhsa3VjQGxpbnV4LnZuZXQuaWJtLmNvbT4K
PiAKPiBEdXJpbmcga2V4ZWMgc29tZSBhZGFwdGVycyBoaXQgYW4gRUVIIHNpbmNlIHRoZXkgYXJl
IG5vdCBwcm9wZXJseQo+IHNodXQgZG93biBpbiB0aGUgcmFkZW9uX3BjaV9zaHV0ZG93bigpIGZ1
bmN0aW9uLiBBZGRpbmcKPiByYWRlb25fc3VzcGVuZF9rbXMoKSBmaXhlcyB0aGlzIGlzc3VlLgo+
IEVuYWJsZWQgb25seSBvbiBQUEMgYmVjYXVzZSB0aGlzIHBhdGNoIGNhdXNlcyBpc3N1ZXMgb24g
c29tZSBvdGhlcgo+IGJvYXJkcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLeWxlIE1haGxrdWNoIDxr
bWFobGt1Y0BsaW51eC52bmV0LmlibS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jIHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykKCjxmb3JtbGV0dGVyPgoKVGhpcyBpcyBub3QgdGhlIGNvcnJlY3Qgd2F5
IHRvIHN1Ym1pdCBwYXRjaGVzIGZvciBpbmNsdXNpb24gaW4gdGhlCnN0YWJsZSBrZXJuZWwgdHJl
ZS4gIFBsZWFzZSByZWFkOgogICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRl
c3QvcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwKZm9yIGhvdyB0byBkbyB0aGlzIHBy
b3Blcmx5LgoKPC9mb3JtbGV0dGVyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
