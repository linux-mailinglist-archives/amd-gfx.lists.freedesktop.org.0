Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0638EF10D
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Nov 2019 00:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E716E8AF;
	Mon,  4 Nov 2019 23:10:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Mon, 04 Nov 2019 23:10:51 UTC
Received: from mail.ud03.udmedia.de (ud03.udmedia.de [194.117.254.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259316E8AF
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Nov 2019 23:10:50 +0000 (UTC)
Received: (qmail 24866 invoked from network); 5 Nov 2019 00:04:08 +0100
Received: by mail.ud03.udmedia.de with ESMTPA; 5 Nov 2019 00:04:08 +0100
X-UD-Smtp-Session: ud03?335p7@QjY/VY2W/sjCdf4e
MIME-Version: 1.0
Date: Tue, 05 Nov 2019 00:04:08 +0100
From: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <Dieter@nuetzel-hh.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: [amd-staging-drm-nex] Planned move to 5.4-rc6+ soon?
Message-ID: <fa2e4af9689cc1fd566876ff8438a90f@nuetzel-hh.de>
X-Sender: Dieter@nuetzel-hh.de
User-Agent: Roundcube Webmail/1.3.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=nuetzel-hh.de;
 h=
 mime-version:content-type:content-transfer-encoding:date:from:to
 :cc:subject:message-id; s=k1; bh=8rI/LPqz+iPSm9NndSnTla0bf35gleg
 oA/E2mElLHfA=; b=UWmtQ6mUg1nZg+yiMwW9QZSW5MK0CxxYbng39Ge2sGJ11cV
 7fUfVYstkxl11DX1h+McRimzOY2PWrH6KpKzQo+1Dwo6bQ+DnI/AYrFj4dtkbpRZ
 +nhJOyVOamASDi3TlHicvRY93+nE1t/oyIT8nviOnb2cDnY9zbgB4GJOq27Y=
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
Cc: amd-devel <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8gQWxleCwKCmxpa2UgQU1ELi4uOy0pCgpbV2h5XQo1LjMtcmNYICgtcmMzKQotIGhhcyBi
cm9rZW4gKHJlZ3Jlc3NlZCkgYmxvY2sgbGF5ZXIgKENEL0RWRCwgZ2FtZXMuLi4pIC0gZml4ZWQg
aW4gNS4zIApmaW5hbAotIEFDUEkgKHBvd2VyIG1hbmFnZW1lbnQpIHJlZ3Jlc3Npb24gLSBmaXhl
ZCBpbiA1LjMgZmluYWwKLSBVU0IgMy4xLzMuMiByZWdyZXNzaW9uICg1LjAwMCB2cyAxMC4wMDAg
TWJpdC9zIG1vZGUsIGluIHVzZSBoZWF2aWx5IApoZXJlKQogICAgZXZlbiB3aXRoIEFNRCdzIHBh
cnRuZXIgQVNNZWRpYSAoQVNNIDIxNDIrIGNoaXBzKSAtIGZpeGVkIGluIDUuNC1yYyAKKCEhISkK
LSBOYXZpIHByb2JsZW1zIChlLmcuIFNETUEpIHNvbWUgcHJvZ3Jlc3MvbWl0aWdhdGlvbiB3aXRo
IDUuNC1yYwoKW0hvd10KU3dpdGNoIHRvIDUuNC1yYzQgKG9yIGJldHRlciAtcmM2KSBhcyBzb29u
IGFzIHBvc3NpYmxlCgpCYWNrIHRvIHBwIHBvd2VyIGNvbnN1bXB0aW9uIHRlc3RpbmcgdGhlbi4u
LgoKR3JlZXRpbmdzLApEaWV0ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
