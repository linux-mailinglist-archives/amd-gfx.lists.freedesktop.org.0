Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD19552FB5
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Jun 2022 12:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4310E6E2;
	Tue, 21 Jun 2022 10:25:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7839410E757;
 Tue, 21 Jun 2022 10:25:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26D7C21E3E;
 Tue, 21 Jun 2022 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655807149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SG/5usc4AqYsZF/bPc724GxjnyvhqHAl6H2jRD0jhiw=;
 b=JHfUJ1YkP2p1KFqJtL1AvB5Qh4LYfaq99Jsuw1AcN6qt+yRZDpLcUnTLfXQ3aeWvcVl9O4
 BySmqRVSBHudb5pzvHP0afYiq3urOdKarFgziMKguxcXBBQK2O8WybgBVqYvQW+D5WshOe
 u41ZMB1/WJ07aEb8WZX1TAcpVKRogCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655807149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SG/5usc4AqYsZF/bPc724GxjnyvhqHAl6H2jRD0jhiw=;
 b=bueNfQcRB3nDQe2KjBSCPnQhIdGCwaHB4p6tS0Nq9+z0vUfYqyoB8doKrAZY4qKwPqQjN5
 ddtZcNmNyJ8+mFCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0460A13638;
 Tue, 21 Jun 2022 10:25:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O1V9O6ycsWKSRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Jun 2022 10:25:48 +0000
Message-ID: <0e29cf45-d713-60d0-8184-e74c3ca0f091@suse.de>
Date: Tue, 21 Jun 2022 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Using generic fbdev helpers breaks hibernation
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <CADnq5_O-TFZrkpVLExDGwXKWV5wfXnhhxvJ+761cLCizk2Qq4A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CADnq5_O-TFZrkpVLExDGwXKWV5wfXnhhxvJ+761cLCizk2Qq4A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0zdDdSbiKmJIFKKz0x4Uqf20"
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0zdDdSbiKmJIFKKz0x4Uqf20
Content-Type: multipart/mixed; boundary="------------f4nyaIGKAcrAmGKIVgMHeRi2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: "Quan, Evan" <Evan.Quan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Message-ID: <0e29cf45-d713-60d0-8184-e74c3ca0f091@suse.de>
Subject: Re: Using generic fbdev helpers breaks hibernation
References: <CADnq5_O-TFZrkpVLExDGwXKWV5wfXnhhxvJ+761cLCizk2Qq4A@mail.gmail.com>
In-Reply-To: <CADnq5_O-TFZrkpVLExDGwXKWV5wfXnhhxvJ+761cLCizk2Qq4A@mail.gmail.com>

--------------f4nyaIGKAcrAmGKIVgMHeRi2
Content-Type: multipart/mixed; boundary="------------SpYKGj0XuwQMViZQ81SY5gJe"

--------------SpYKGj0XuwQMViZQ81SY5gJe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDYuMjIgdW0gMDA6MDIgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE1h
eWJlIHNvbWVvbmUgbW9yZSBmYW1pbGlhciB3aXRoIHRoZSBnZW5lcmljIGRybSBmYmRldiBo
ZWxwZXJzIGNhbg0KPiBoZWxwIG1lIHVuZGVyc3RhbmQgd2h5IHRoZXkgZG9uJ3Qgd29yayB3
aXRoIGhpYmVybmF0aW9uLCBhdCBsZWFzdCB3aXRoDQo+IEFNRCBHUFVzLiAgV2UgY29udmVy
dGVkIGFtZGdwdSB0byB1c2UgdGhlIGdlbmVyaWMgaGVscGVycyBpbnN0ZWFkIG9mDQo+IHJv
bGxpbmcgb3VyIG93biBpbiB0aGlzIHBhdGNoWzFdLCBidXQgaXQgc2VlbXMgdG8gaGF2ZSBi
cm9rZW4NCj4gaGliZXJuYXRpb25bMl0uICBhbWRncHUgaGFzIGFsd2F5cyBzZXQgbW9kZV9j
b25maWcucHJlZmVyX3NoYWRvdyA9IDEsDQo+IGJ1dCB0aGF0IHNlZW1zIHRvIGJlIHRoZSBj
YXVzZSBvZiB0aGUgaGliZXJuYXRpb24gYnJlYWthZ2Ugd2l0aCB0aGUNCj4gZ2VuZXJpYyBo
ZWxwZXJzLiAgSSd2ZSBiZWVuIHN0YXJpbmcgYXQgdGhlIGNvZGUgZm9yIGEgd2hpbGUgbm93
IGJ1dCBJDQo+IGNhbid0IHNlZSB3aHkgdGhpcyBmYWlscy4gIEFueSBwb2ludGVycz8NCg0K
SSBkb24ndCB0aGUgYWN0dWFsIHJlYXNvbiwgYnV0IHdoZW4gSSB0cmllZCB0byBjb252ZXJ0
IHJhZGVvbiB0byBnZW5lcmljIA0KZmJkZXYgZW11bGF0aW9uLCBJIGhhZCB0byBtb2RpZnkg
dGhlIGZiZGV2IGNvZGUgYSBiaXQuIEkgZG9uJ3Qgc2VlIGhvdyANCnRoaXMgd291bGQgYXBw
bHkgdG8gYW1kZ3B1LCBidXQgeW91IGNhbiBmaW5kIHRoZSBwYXRjaHNldCBhdHRhY2hlZC4g
U2VlIA0KcGF0Y2hlcyAxIGFuZCAyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBUaGFua3MsDQo+IA0KPiBBbGV4DQo+IA0KPiBbMV0gLSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
Lz9pZD0wODc0NTFmMzcyYmY3NmQ5NzExODRjYWEyNTg4MDdiN2MzNWFhYzhmDQo+IFsyXSAt
IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE2MTE5DQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=
--------------SpYKGj0XuwQMViZQ81SY5gJe
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-fb-helper-Set-framebuffer-for-vga-switcheroo-cli.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-fb-helper-Set-framebuffer-for-vga-switcheroo-cli.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjMTM1NjNlYzk5MmFjYTNiYzQyNGU0ZDdiOTM2M2IxOWU1YTIzZDc0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxMiBOb3YgMjAyMCAwOTozMjo1OCArMDEwMApTdWJqZWN0
OiBbUEFUQ0ggMS8zXSBkcm0vZmItaGVscGVyOiBTZXQgZnJhbWVidWZmZXIgZm9yIHZnYS1z
d2l0Y2hlcm9vIGNsaWVudHMKClNldCB0aGUgZnJhbWVidWZmZXIgaW5mbyBmb3IgZGV2aWNl
cyB0aGF0IHN1cHBvcnQgdmdhIHN3aXRjaGVyb28uIEZvcgpvdGhlciBkZXZpY2VzLCB0aGlz
IGRvZXMgbm90aGluZy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YyB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgfCAx
MiAtLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgICAgICAg
ICB8ICA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAg
ICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmggICAgIHwg
IDEgLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMgICAgIHwgMTIgLS0t
LS0tLS0tLS0tCiA3IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDI4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggY2RmMDgx
ODA4OGIzLi4wOTVhYTdjZTliNzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oCkBAIC0xMjczLDcgKzEyNzMsNiBAQCBleHRlcm4gY29uc3QgaW50IGFtZGdwdV9tYXhf
a21zX2lvY3RsOwogCiBpbnQgYW1kZ3B1X2RyaXZlcl9sb2FkX2ttcyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdW5zaWduZWQgbG9uZyBmbGFncyk7CiB2b2lkIGFtZGdwdV9kcml2
ZXJfdW5sb2FkX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKLXZvaWQgYW1kZ3B1X2Ry
aXZlcl9sYXN0Y2xvc2Vfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogaW50IGFtZGdw
dV9kcml2ZXJfb3Blbl9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9m
aWxlICpmaWxlX3ByaXYpOwogdm9pZCBhbWRncHVfZHJpdmVyX3Bvc3RjbG9zZV9rbXMoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQkgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYp
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IGJiMWMw
MjVkOTAwMS4uMjI3ZmUzMTk1MmE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCkBAIC0yNjU4LDcgKzI2NTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9kcml2ZXIgYW1kZ3B1X2ttc19kcml2ZXIgPSB7CiAJICAgIERSSVZFUl9TWU5DT0JK
X1RJTUVMSU5FLAogCS5vcGVuID0gYW1kZ3B1X2RyaXZlcl9vcGVuX2ttcywKIAkucG9zdGNs
b3NlID0gYW1kZ3B1X2RyaXZlcl9wb3N0Y2xvc2Vfa21zLAotCS5sYXN0Y2xvc2UgPSBhbWRn
cHVfZHJpdmVyX2xhc3RjbG9zZV9rbXMsCisJLmxhc3RjbG9zZSA9IGRybV9mYl9oZWxwZXJf
bGFzdGNsb3NlLAogCS5pb2N0bHMgPSBhbWRncHVfaW9jdGxzX2ttcywKIAkubnVtX2lvY3Rs
cyA9IEFSUkFZX1NJWkUoYW1kZ3B1X2lvY3Rsc19rbXMpLAogCS5kdW1iX2NyZWF0ZSA9IGFt
ZGdwdV9tb2RlX2R1bWJfY3JlYXRlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ttcy5jCmluZGV4IDZiNjI2YzI5M2U3Mi4uZGIwMzlkOTA1YWQyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCkBAIC0xMDYzLDE4ICsxMDYzLDYg
QEAgaW50IGFtZGdwdV9pbmZvX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlscCkKIC8qCiAgKiBPdXRkYXRlZCBtZXNzIGZv
ciBvbGQgZHJtIHdpdGggWG9yZyBiZWluZyBpbiBjaGFyZ2UgKHZvaWQgZnVuY3Rpb24gbm93
KS4KICAqLwotLyoqCi0gKiBhbWRncHVfZHJpdmVyX2xhc3RjbG9zZV9rbXMgLSBkcm0gY2Fs
bGJhY2sgZm9yIGxhc3QgY2xvc2UKLSAqCi0gKiBAZGV2OiBkcm0gZGV2IHBvaW50ZXIKLSAq
Ci0gKiBTd2l0Y2ggdmdhX3N3aXRjaGVyb28gc3RhdGUgYWZ0ZXIgbGFzdCBjbG9zZSAoYWxs
IGFzaWNzKS4KLSAqLwotdm9pZCBhbWRncHVfZHJpdmVyX2xhc3RjbG9zZV9rbXMoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKLXsKLQlkcm1fZmJfaGVscGVyX2xhc3RjbG9zZShkZXYpOwot
CXZnYV9zd2l0Y2hlcm9vX3Byb2Nlc3NfZGVsYXllZF9zd2l0Y2goKTsKLX0KIAogLyoqCiAg
KiBhbWRncHVfZHJpdmVyX29wZW5fa21zIC0gZHJtIGNhbGxiYWNrIGZvciBvcGVuCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCA3YjMwNGJjOGE2YTcuLjNhYWYyMmIwYjlmMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC0zMyw4ICszMywxMCBAQAogI2luY2x1
ZGUgPGxpbnV4L2RtYS1idWYuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KICNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvc3lzcnEuaD4KKyNpbmNsdWRlIDxs
aW51eC92Z2Ffc3dpdGNoZXJvby5oPgogI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KIAog
I2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+CkBAIC0yMDY2LDYgKzIwNjgsOCBAQCBFWFBP
UlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVudCk7CiB2b2lkIGRybV9mYl9o
ZWxwZXJfbGFzdGNsb3NlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJZHJtX2ZiX2hl
bHBlcl9yZXN0b3JlX2ZiZGV2X21vZGVfdW5sb2NrZWQoZGV2LT5mYl9oZWxwZXIpOworCisJ
dmdhX3N3aXRjaGVyb29fcHJvY2Vzc19kZWxheWVkX3N3aXRjaCgpOwogfQogRVhQT1JUX1NZ
TUJPTChkcm1fZmJfaGVscGVyX2xhc3RjbG9zZSk7CiAKQEAgLTI0NzYsNiArMjQ4MCwxMCBA
QCBzdGF0aWMgaW50IGRybV9mYl9oZWxwZXJfZ2VuZXJpY19wcm9iZShzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciAqZmJfaGVscGVyLAogCQlmYl9kZWZlcnJlZF9pb19pbml0KGZiaSk7CiAJfQog
CisJLyogU2V0IHRoZSBmYiBpbmZvIGZvciB2Z2Fzd2l0Y2hlcm9vIGNsaWVudHMuIERvZXMg
bm90aGluZyBvdGhlcndpc2UuICovCisJaWYgKGRldl9pc19wY2koZGV2LT5kZXYpKQorCQl2
Z2Ffc3dpdGNoZXJvb19jbGllbnRfZmJfc2V0KHRvX3BjaV9kZXYoZGV2LT5kZXYpLCBmYmkp
OworCiAJcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMK
aW5kZXggOTU2YzcyYjVhYTMzLi41ZTA1M2RhMzY5OTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jCkBAIC02MDQsNyArNjA0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZHJpdmVyIGttc19kcml2ZXIgPSB7CiAJLmxvYWQgPSByYWRlb25fZHJpdmVyX2xv
YWRfa21zLAogCS5vcGVuID0gcmFkZW9uX2RyaXZlcl9vcGVuX2ttcywKIAkucG9zdGNsb3Nl
ID0gcmFkZW9uX2RyaXZlcl9wb3N0Y2xvc2Vfa21zLAotCS5sYXN0Y2xvc2UgPSByYWRlb25f
ZHJpdmVyX2xhc3RjbG9zZV9rbXMsCisJLmxhc3RjbG9zZSA9IGRybV9mYl9oZWxwZXJfbGFz
dGNsb3NlLAogCS51bmxvYWQgPSByYWRlb25fZHJpdmVyX3VubG9hZF9rbXMsCiAJLmlvY3Rs
cyA9IHJhZGVvbl9pb2N0bHNfa21zLAogCS5udW1faW9jdGxzID0gQVJSQVlfU0laRShyYWRl
b25faW9jdGxzX2ttcyksCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5oCmluZGV4
IGFjNzk3MDkxOWM0ZC4uMmZmZTA5NzVlZTU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuaApAQCAtMTIwLDcgKzEyMCw2IEBAIGxvbmcgcmFkZW9uX2RybV9pb2N0bChz
dHJ1Y3QgZmlsZSAqZmlscCwKIAogaW50IHJhZGVvbl9kcml2ZXJfbG9hZF9rbXMoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBmbGFncyk7CiB2b2lkIHJhZGVvbl9k
cml2ZXJfdW5sb2FkX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKLXZvaWQgcmFkZW9u
X2RyaXZlcl9sYXN0Y2xvc2Vfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogaW50IHJh
ZGVvbl9kcml2ZXJfb3Blbl9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRy
bV9maWxlICpmaWxlX3ByaXYpOwogdm9pZCByYWRlb25fZHJpdmVyX3Bvc3RjbG9zZV9rbXMo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQkgc3RydWN0IGRybV9maWxlICpmaWxlX3By
aXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwppbmRleCA5NjUxNjFiODU2
NWIuLjhjMjQxNGJiMmRmZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMK
QEAgLTYyNiwxOCArNjI2LDYgQEAgaW50IHJhZGVvbl9pbmZvX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlscCkKIC8qCiAg
KiBPdXRkYXRlZCBtZXNzIGZvciBvbGQgZHJtIHdpdGggWG9yZyBiZWluZyBpbiBjaGFyZ2Ug
KHZvaWQgZnVuY3Rpb24gbm93KS4KICAqLwotLyoqCi0gKiByYWRlb25fZHJpdmVyX2xhc3Rj
bG9zZV9rbXMgLSBkcm0gY2FsbGJhY2sgZm9yIGxhc3QgY2xvc2UKLSAqCi0gKiBAZGV2OiBk
cm0gZGV2IHBvaW50ZXIKLSAqCi0gKiBTd2l0Y2ggdmdhX3N3aXRjaGVyb28gc3RhdGUgYWZ0
ZXIgbGFzdCBjbG9zZSAoYWxsIGFzaWNzKS4KLSAqLwotdm9pZCByYWRlb25fZHJpdmVyX2xh
c3RjbG9zZV9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsKLQlkcm1fZmJfaGVscGVy
X2xhc3RjbG9zZShkZXYpOwotCXZnYV9zd2l0Y2hlcm9vX3Byb2Nlc3NfZGVsYXllZF9zd2l0
Y2goKTsKLX0KIAogLyoqCiAgKiByYWRlb25fZHJpdmVyX29wZW5fa21zIC0gZHJtIGNhbGxi
YWNrIGZvciBvcGVuCi0tIAoyLjM2LjEKCg==
--------------SpYKGj0XuwQMViZQ81SY5gJe
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-drm-fb-helper-Add-hint-to-enable-VT-switching-during.patch"
Content-Disposition: attachment;
 filename*0="0002-drm-fb-helper-Add-hint-to-enable-VT-switching-during.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmYTY1NDJjNjRiNTg1ZDRlZDE4ZTA1MmZhZDg3ZjU0OTQ2NzFjOTBiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxMiBOb3YgMjAyMCAxMzozNzo1NCArMDEwMApTdWJqZWN0
OiBbUEFUQ0ggMi8zXSBkcm0vZmItaGVscGVyOiBBZGQgaGludCB0byBlbmFibGUgVlQgc3dp
dGNoaW5nIGR1cmluZwogc3VzcGVuZC9yZXN1bWUKClN3aXRjaGluZyBWVHMgZHVyaW5nIHN1
c3BlbmQvcmVzdW1lIGlzIHJlcXVpcmVkIHRvIHJlbGlhYmx5IHJ1biByYWRlb24Kd2l0aCBn
ZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMgICAgfCA4ICsrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9mYi5jIHwgNiArKystLS0KIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICAg
fCA3ICsrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCAzYWFmMjJiMGI5ZjEu
LmViMzRjZDUzMDc5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC01NTUsMTEg
KzU1NSwxMSBAQCBFWFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfaW5pdCk7CiAgKi8KIHN0
cnVjdCBmYl9pbmZvICpkcm1fZmJfaGVscGVyX2FsbG9jX2ZiaShzdHJ1Y3QgZHJtX2ZiX2hl
bHBlciAqZmJfaGVscGVyKQogewotCXN0cnVjdCBkZXZpY2UgKmRldiA9IGZiX2hlbHBlci0+
ZGV2LT5kZXY7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGZiX2hlbHBlci0+ZGV2Owog
CXN0cnVjdCBmYl9pbmZvICppbmZvOwogCWludCByZXQ7CiAKLQlpbmZvID0gZnJhbWVidWZm
ZXJfYWxsb2MoMCwgZGV2KTsKKwlpbmZvID0gZnJhbWVidWZmZXJfYWxsb2MoMCwgZGV2LT5k
ZXYpOwogCWlmICghaW5mbykKIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CiAKQEAgLTU4
Miw3ICs1ODIsOSBAQCBzdHJ1Y3QgZmJfaW5mbyAqZHJtX2ZiX2hlbHBlcl9hbGxvY19mYmko
c3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKIAl9CiAKIAlmYl9oZWxwZXItPmZi
ZGV2ID0gaW5mbzsKLQlpbmZvLT5za2lwX3Z0X3N3aXRjaCA9IHRydWU7CisKKwlpZiAoIWRl
di0+bW9kZV9jb25maWcucmVxdWlyZV92dF9zd2l0Y2hfZmJkZXYpCisJCWluZm8tPnNraXBf
dnRfc3dpdGNoID0gdHJ1ZTsKIAogCXJldHVybiBpbmZvOwogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZmIuYwppbmRleCBjYTM4MmZiZjdhODYuLmE5MDZiMzQ4OTI0ZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYi5jCkBAIC0yNDEsNiArMjQxLDkgQEAgc3RhdGlj
IGludCByYWRlb25mYl9jcmVhdGUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciwKIAog
CXJibyA9IGdlbV90b19yYWRlb25fYm8oZ29iaik7CiAKKwkvKiByYWRlb24gcmVzdW1lIGlz
IGZyYWdpbGUgYW5kIG5lZWRzIGEgdnQgc3dpdGNoIHRvIGhlbHAgaXQgYWxvbmcgKi8KKwly
ZGV2LT5kZGV2LT5tb2RlX2NvbmZpZy5yZXF1aXJlX3Z0X3N3aXRjaF9mYmRldiA9IHRydWU7
CisKIAkvKiBva2F5IHdlIGhhdmUgYW4gb2JqZWN0IG5vdyBhbGxvY2F0ZSB0aGUgZnJhbWVi
dWZmZXIgKi8KIAlpbmZvID0gZHJtX2ZiX2hlbHBlcl9hbGxvY19mYmkoaGVscGVyKTsKIAlp
ZiAoSVNfRVJSKGluZm8pKSB7CkBAIC0yNDgsOSArMjUxLDYgQEAgc3RhdGljIGludCByYWRl
b25mYl9jcmVhdGUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciwKIAkJZ290byBvdXQ7
CiAJfQogCi0JLyogcmFkZW9uIHJlc3VtZSBpcyBmcmFnaWxlIGFuZCBuZWVkcyBhIHZ0IHN3
aXRjaCB0byBoZWxwIGl0IGFsb25nICovCi0JaW5mby0+c2tpcF92dF9zd2l0Y2ggPSBmYWxz
ZTsKLQogCXJldCA9IHJhZGVvbl9mcmFtZWJ1ZmZlcl9pbml0KHJkZXYtPmRkZXYsICZyZmJk
ZXYtPmZiLCAmbW9kZV9jbWQsIGdvYmopOwogCWlmIChyZXQpIHsKIAkJRFJNX0VSUk9SKCJm
YWlsZWQgdG8gaW5pdGlhbGl6ZSBmcmFtZWJ1ZmZlciAlZFxuIiwgcmV0KTsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIGIvaW5jbHVkZS9kcm0vZHJtX21v
ZGVfY29uZmlnLmgKaW5kZXggNmI1ZTAxMjk1MzQ4Li5jZGVmOTRkMmMwZWYgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oCisrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9tb2RlX2NvbmZpZy5oCkBAIC04ODksNiArODg5LDEzIEBAIHN0cnVjdCBkcm1fbW9kZV9j
b25maWcgewogCSAqLwogCWJvb2wgcHJlZmVyX3NoYWRvd19mYmRldjsKIAorCS8qKgorCSAq
IEByZXF1aXJlX3Z0X3N3aXRjaF9mYmRldjoKKwkgKgorCSAqIEhpbnQgdG8gZnJhbWVidWZm
ZXIgZW11bGF0aW9uIHRvIGVuYWJsZSBWVCBzd2l0Y2hpbmcgb24gc3VzcGVuZC9yZXN1bWUu
CisJICovCisJYm9vbCByZXF1aXJlX3Z0X3N3aXRjaF9mYmRldjsKKwogCS8qKgogCSAqIEBx
dWlya19hZGRmYl9wcmVmZXJfeGJncl8zMGJwcDoKIAkgKgotLSAKMi4zNi4xCgo=
--------------SpYKGj0XuwQMViZQ81SY5gJe
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-drm-radeon-Replace-framebuffer-console-with-generic-.patch"
Content-Disposition: attachment;
 filename*0="0003-drm-radeon-Replace-framebuffer-console-with-generic-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzOGJlY2Y3ZDUwMDM4NjQzZGNhYzZmMTYyNWVlNGViYTBkMjJjZDYwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogV2VkLCAxNiBNYXIgMjAyMiAxMTowNzo0OSArMDEwMApTdWJqZWN0
OiBbUEFUQ0ggMy8zXSBkcm0vcmFkZW9uOiBSZXBsYWNlIGZyYW1lYnVmZmVyIGNvbnNvbGUg
d2l0aCBnZW5lcmljCiBpbXBsZW1lbnRhdGlvbgoKVGhlIGZiZGV2IGNvZGUgaW4gcmFkZW9u
IGNhbiBiZSByZXBsYWNlZCBieSB0aGUgZ2VuZXJpYyBmYmRldiBoZWxwZXJzLgpUaGlzIGFs
bG93cyBmb3IgdXNpbmcgZmJkZXYgc2hhZG93IGJ1ZmZlcnMgYW5kIElHVCB0ZXN0Y2FzZXMu
CgpHZW5lcmljIGZiZGV2IGFjdHMgbGlrZSBhIHJlZ3VsYXIgRFJNIGNsaWVudCBhbmQgaGFz
IHRvIGJlIGluaXRpYWxpemVkCmFmdGVyIHJlZ2lzdGVyaW5nIHRoZSBEUk0gZGV2aWNlLiBD
aGFuZ2UgdGhlIGRyaXZlciBpbml0aWFsaXphdGlvbgphY2NvcmRpbmdseS4gVGhlIHJlbGVh
c2UgaGFwcGVucyBhdXRvbWF0aWNhbGx5IGR1cmluZyBzaHV0ZG93bi4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyB8ICAgMiAtCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZmIuYyAgICAgIHwgMzM3ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW9kZS5oICAgIHwgICA3ICstCiA0
IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMzMSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKaW5kZXggYjlhMDc2Nzdh
NzFlLi5iNDVkNjFjOGQ1NmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
aXNwbGF5LmMKQEAgLTE2MzcsNyArMTYzNyw2IEBAIGludCByYWRlb25fbW9kZXNldF9pbml0
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCS8qIHNldHVwIGFmbXQgKi8KIAlyYWRl
b25fYWZtdF9pbml0KHJkZXYpOwogCi0JcmFkZW9uX2ZiZGV2X2luaXQocmRldik7CiAJZHJt
X2ttc19oZWxwZXJfcG9sbF9pbml0KHJkZXYtPmRkZXYpOwogCiAJLyogZG8gcG0gbGF0ZSBp
bml0ICovCkBAIC0xNjUyLDcgKzE2NTEsNiBAQCB2b2lkIHJhZGVvbl9tb2Rlc2V0X2Zpbmko
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJCWRybV9rbXNfaGVscGVyX3BvbGxfZmlu
aShyZGV2LT5kZGV2KTsKIAkJcmFkZW9uX2hwZF9maW5pKHJkZXYpOwogCQlkcm1faGVscGVy
X2ZvcmNlX2Rpc2FibGVfYWxsKHJkZXYtPmRkZXYpOwotCQlyYWRlb25fZmJkZXZfZmluaShy
ZGV2KTsKIAkJcmFkZW9uX2FmbXRfZmluaShyZGV2KTsKIAkJZHJtX21vZGVfY29uZmlnX2Ns
ZWFudXAocmRldi0+ZGRldik7CiAJCXJkZXYtPm1vZGVfaW5mby5tb2RlX2NvbmZpZ19pbml0
aWFsaXplZCA9IGZhbHNlOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwppbmRl
eCA1ZTA1M2RhMzY5OTAuLjlmYzU4Y2MxNmMzMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZHJ2LmMKQEAgLTM0Nyw2ICszNDcsOCBAQCBzdGF0aWMgaW50IHJhZGVvbl9wY2lf
cHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJaWYgKHJldCkKIAkJZ290byBlcnJfYWdw
OwogCisJcmFkZW9uX2ZiZGV2X2luaXQoZGV2LT5kZXZfcHJpdmF0ZSk7CisKIAlyZXR1cm4g
MDsKIAogZXJyX2FncDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYi5jCmluZGV4IGE5
MDZiMzQ4OTI0Zi4uZTNhNjAxYTI0ZDYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9mYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2ZiLmMKQEAgLTI0LDY3ICsyNCwxMiBAQAogICogICAgIERhdmlkIEFpcmxpZQogICovCiAK
LSNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KLSNp
bmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Ci0jaW5jbHVkZSA8bGludXgvc2xhYi5oPgot
I2luY2x1ZGUgPGxpbnV4L3ZnYV9zd2l0Y2hlcm9vLmg+CiAKLSNpbmNsdWRlIDxkcm0vZHJt
X2NydGMuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9mYl9oZWxwZXIuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPgotI2lu
Y2x1ZGUgPGRybS9yYWRlb25fZHJtLmg+CiAKICNpbmNsdWRlICJyYWRlb24uaCIKIAotLyog
b2JqZWN0IGhpZXJhcmNoeSAtCi0gKiB0aGlzIGNvbnRhaW5zIGEgaGVscGVyICsgYSByYWRl
b24gZmIKLSAqIHRoZSBoZWxwZXIgY29udGFpbnMgYSBwb2ludGVyIHRvIHJhZGVvbiBmcmFt
ZWJ1ZmZlciBiYXNlY2xhc3MuCi0gKi8KLXN0cnVjdCByYWRlb25fZmJkZXYgewotCXN0cnVj
dCBkcm1fZmJfaGVscGVyIGhlbHBlcjsgLyogbXVzdCBiZSBmaXJzdCAqLwotCXN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgZmI7Ci0Jc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXY7Ci19Owot
Ci1zdGF0aWMgaW50Ci1yYWRlb25mYl9vcGVuKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQg
dXNlcikKLXsKLQlzdHJ1Y3QgcmFkZW9uX2ZiZGV2ICpyZmJkZXYgPSBpbmZvLT5wYXI7Ci0J
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYgPSByZmJkZXYtPnJkZXY7Ci0JaW50IHJldCA9
IHBtX3J1bnRpbWVfZ2V0X3N5bmMocmRldi0+ZGRldi0+ZGV2KTsKLQotCWlmIChyZXQgPCAw
ICYmIHJldCAhPSAtRUFDQ0VTKSB7Ci0JCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocmRl
di0+ZGRldi0+ZGV2KTsKLQkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQocmRldi0+ZGRl
di0+ZGV2KTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0JcmV0dXJuIDA7Ci19Ci0KLXN0YXRpYyBp
bnQKLXJhZGVvbmZiX3JlbGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIGludCB1c2VyKQot
ewotCXN0cnVjdCByYWRlb25fZmJkZXYgKnJmYmRldiA9IGluZm8tPnBhcjsKLQlzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiA9IHJmYmRldi0+cmRldjsKLQotCXBtX3J1bnRpbWVfbWFy
a19sYXN0X2J1c3kocmRldi0+ZGRldi0+ZGV2KTsKLQlwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZChyZGV2LT5kZGV2LT5kZXYpOwotCXJldHVybiAwOwotfQotCi1zdGF0aWMgY29uc3Qg
c3RydWN0IGZiX29wcyByYWRlb25mYl9vcHMgPSB7Ci0JLm93bmVyID0gVEhJU19NT0RVTEUs
Ci0JRFJNX0ZCX0hFTFBFUl9ERUZBVUxUX09QUywKLQkuZmJfb3BlbiA9IHJhZGVvbmZiX29w
ZW4sCi0JLmZiX3JlbGVhc2UgPSByYWRlb25mYl9yZWxlYXNlLAotCS5mYl9maWxscmVjdCA9
IGRybV9mYl9oZWxwZXJfY2ZiX2ZpbGxyZWN0LAotCS5mYl9jb3B5YXJlYSA9IGRybV9mYl9o
ZWxwZXJfY2ZiX2NvcHlhcmVhLAotCS5mYl9pbWFnZWJsaXQgPSBkcm1fZmJfaGVscGVyX2Nm
Yl9pbWFnZWJsaXQsCi19OwotCi0KIGludCByYWRlb25fYWxpZ25fcGl0Y2goc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYsIGludCB3aWR0aCwgaW50IGNwcCwgYm9vbCB0aWxlZCkKIHsK
IAlpbnQgYWxpZ25lZCA9IHdpZHRoOwpAQCAtMTA5LDI5MSArNTQsMzcgQEAgaW50IHJhZGVv
bl9hbGlnbl9waXRjaChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgaW50IHdpZHRoLCBp
bnQgY3BwLCBib29sIHRpbGUKIAlyZXR1cm4gYWxpZ25lZCAqIGNwcDsKIH0KIAotc3RhdGlj
IHZvaWQgcmFkZW9uZmJfZGVzdHJveV9waW5uZWRfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqZ29iaikKLXsKLQlzdHJ1Y3QgcmFkZW9uX2JvICpyYm8gPSBnZW1fdG9fcmFkZW9u
X2JvKGdvYmopOwotCWludCByZXQ7Ci0KLQlyZXQgPSByYWRlb25fYm9fcmVzZXJ2ZShyYm8s
IGZhbHNlKTsKLQlpZiAobGlrZWx5KHJldCA9PSAwKSkgewotCQlyYWRlb25fYm9fa3VubWFw
KHJibyk7Ci0JCXJhZGVvbl9ib191bnBpbihyYm8pOwotCQlyYWRlb25fYm9fdW5yZXNlcnZl
KHJibyk7Ci0JfQotCWRybV9nZW1fb2JqZWN0X3B1dChnb2JqKTsKLX0KLQotc3RhdGljIGlu
dCByYWRlb25mYl9jcmVhdGVfcGlubmVkX29iamVjdChzdHJ1Y3QgcmFkZW9uX2ZiZGV2ICpy
ZmJkZXYsCi0JCQkJCSBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQsCi0JCQkJ
CSBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKipnb2JqX3ApCi17Ci0JY29uc3Qgc3RydWN0IGRy
bV9mb3JtYXRfaW5mbyAqaW5mbzsKLQlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiA9IHJm
YmRldi0+cmRldjsKLQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmogPSBOVUxMOwotCXN0
cnVjdCByYWRlb25fYm8gKnJibyA9IE5VTEw7Ci0JYm9vbCBmYl90aWxlZCA9IGZhbHNlOyAv
KiB1c2VmdWwgZm9yIHRlc3RpbmcgKi8KLQl1MzIgdGlsaW5nX2ZsYWdzID0gMDsKLQlpbnQg
cmV0OwotCWludCBhbGlnbmVkX3NpemUsIHNpemU7Ci0JaW50IGhlaWdodCA9IG1vZGVfY21k
LT5oZWlnaHQ7Ci0JdTMyIGNwcDsKLQotCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKHJk
ZXYtPmRkZXYsIG1vZGVfY21kKTsKLQljcHAgPSBpbmZvLT5jcHBbMF07Ci0KLQkvKiBuZWVk
IHRvIGFsaWduIHBpdGNoIHdpdGggY3J0YyBsaW1pdHMgKi8KLQltb2RlX2NtZC0+cGl0Y2hl
c1swXSA9IHJhZGVvbl9hbGlnbl9waXRjaChyZGV2LCBtb2RlX2NtZC0+d2lkdGgsIGNwcCwK
LQkJCQkJCSAgZmJfdGlsZWQpOwotCi0JaWYgKHJkZXYtPmZhbWlseSA+PSBDSElQX1I2MDAp
Ci0JCWhlaWdodCA9IEFMSUdOKG1vZGVfY21kLT5oZWlnaHQsIDgpOwotCXNpemUgPSBtb2Rl
X2NtZC0+cGl0Y2hlc1swXSAqIGhlaWdodDsKLQlhbGlnbmVkX3NpemUgPSBBTElHTihzaXpl
LCBQQUdFX1NJWkUpOwotCXJldCA9IHJhZGVvbl9nZW1fb2JqZWN0X2NyZWF0ZShyZGV2LCBh
bGlnbmVkX3NpemUsIDAsCi0JCQkJICAgICAgIFJBREVPTl9HRU1fRE9NQUlOX1ZSQU0sCi0J
CQkJICAgICAgIDAsIHRydWUsICZnb2JqKTsKLQlpZiAocmV0KSB7Ci0JCXByX2VycigiZmFp
bGVkIHRvIGFsbG9jYXRlIGZyYW1lYnVmZmVyICglZClcbiIsIGFsaWduZWRfc2l6ZSk7Ci0J
CXJldHVybiAtRU5PTUVNOwotCX0KLQlyYm8gPSBnZW1fdG9fcmFkZW9uX2JvKGdvYmopOwot
Ci0JaWYgKGZiX3RpbGVkKQotCQl0aWxpbmdfZmxhZ3MgPSBSQURFT05fVElMSU5HX01BQ1JP
OwotCi0jaWZkZWYgX19CSUdfRU5ESUFOCi0Jc3dpdGNoIChjcHApIHsKLQljYXNlIDQ6Ci0J
CXRpbGluZ19mbGFncyB8PSBSQURFT05fVElMSU5HX1NXQVBfMzJCSVQ7Ci0JCWJyZWFrOwot
CWNhc2UgMjoKLQkJdGlsaW5nX2ZsYWdzIHw9IFJBREVPTl9USUxJTkdfU1dBUF8xNkJJVDsK
LQkJYnJlYWs7Ci0JZGVmYXVsdDoKLQkJYnJlYWs7Ci0JfQotI2VuZGlmCi0KLQlpZiAodGls
aW5nX2ZsYWdzKSB7Ci0JCXJldCA9IHJhZGVvbl9ib19zZXRfdGlsaW5nX2ZsYWdzKHJibywK
LQkJCQkJCSB0aWxpbmdfZmxhZ3MgfCBSQURFT05fVElMSU5HX1NVUkZBQ0UsCi0JCQkJCQkg
bW9kZV9jbWQtPnBpdGNoZXNbMF0pOwotCQlpZiAocmV0KQotCQkJZGV2X2VycihyZGV2LT5k
ZXYsICJGQiBmYWlsZWQgdG8gc2V0IHRpbGluZyBmbGFnc1xuIik7Ci0JfQotCi0KLQlyZXQg
PSByYWRlb25fYm9fcmVzZXJ2ZShyYm8sIGZhbHNlKTsKLQlpZiAodW5saWtlbHkocmV0ICE9
IDApKQotCQlnb3RvIG91dF91bnJlZjsKLQkvKiBPbmx5IDI3IGJpdCBvZmZzZXQgZm9yIGxl
Z2FjeSBDUlRDICovCi0JcmV0ID0gcmFkZW9uX2JvX3Bpbl9yZXN0cmljdGVkKHJibywgUkFE
RU9OX0dFTV9ET01BSU5fVlJBTSwKLQkJCQkgICAgICAgQVNJQ19JU19BVklWTyhyZGV2KSA/
IDAgOiAxIDw8IDI3LAotCQkJCSAgICAgICBOVUxMKTsKLQlpZiAocmV0KSB7Ci0JCXJhZGVv
bl9ib191bnJlc2VydmUocmJvKTsKLQkJZ290byBvdXRfdW5yZWY7Ci0JfQotCWlmIChmYl90
aWxlZCkKLQkJcmFkZW9uX2JvX2NoZWNrX3RpbGluZyhyYm8sIDAsIDApOwotCXJldCA9IHJh
ZGVvbl9ib19rbWFwKHJibywgTlVMTCk7Ci0JcmFkZW9uX2JvX3VucmVzZXJ2ZShyYm8pOwot
CWlmIChyZXQpCi0JCWdvdG8gb3V0X3VucmVmOwotCi0JKmdvYmpfcCA9IGdvYmo7Ci0JcmV0
dXJuIDA7Ci1vdXRfdW5yZWY6Ci0JcmFkZW9uZmJfZGVzdHJveV9waW5uZWRfb2JqZWN0KGdv
YmopOwotCSpnb2JqX3AgPSBOVUxMOwotCXJldHVybiByZXQ7Ci19Ci0KLXN0YXRpYyBpbnQg
cmFkZW9uZmJfY3JlYXRlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIsCi0JCQkgICBz
dHJ1Y3QgZHJtX2ZiX2hlbHBlcl9zdXJmYWNlX3NpemUgKnNpemVzKQotewotCXN0cnVjdCBy
YWRlb25fZmJkZXYgKnJmYmRldiA9Ci0JCWNvbnRhaW5lcl9vZihoZWxwZXIsIHN0cnVjdCBy
YWRlb25fZmJkZXYsIGhlbHBlcik7Ci0Jc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYgPSBy
ZmJkZXYtPnJkZXY7Ci0Jc3RydWN0IGZiX2luZm8gKmluZm87Ci0Jc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIgPSBOVUxMOwotCXN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyIG1vZGVfY21k
OwotCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiA9IE5VTEw7Ci0Jc3RydWN0IHJhZGVv
bl9ibyAqcmJvID0gTlVMTDsKLQlpbnQgcmV0OwotCXVuc2lnbmVkIGxvbmcgdG1wOwotCi0J
bW9kZV9jbWQud2lkdGggPSBzaXplcy0+c3VyZmFjZV93aWR0aDsKLQltb2RlX2NtZC5oZWln
aHQgPSBzaXplcy0+c3VyZmFjZV9oZWlnaHQ7Ci0KLQkvKiBhdml2byBjYW4ndCBzY2Fub3V0
IHJlYWwgMjRicHAgKi8KLQlpZiAoKHNpemVzLT5zdXJmYWNlX2JwcCA9PSAyNCkgJiYgQVNJ
Q19JU19BVklWTyhyZGV2KSkKLQkJc2l6ZXMtPnN1cmZhY2VfYnBwID0gMzI7Ci0KLQltb2Rl
X2NtZC5waXhlbF9mb3JtYXQgPSBkcm1fbW9kZV9sZWdhY3lfZmJfZm9ybWF0KHNpemVzLT5z
dXJmYWNlX2JwcCwKLQkJCQkJCQkgIHNpemVzLT5zdXJmYWNlX2RlcHRoKTsKLQotCXJldCA9
IHJhZGVvbmZiX2NyZWF0ZV9waW5uZWRfb2JqZWN0KHJmYmRldiwgJm1vZGVfY21kLCAmZ29i
aik7Ci0JaWYgKHJldCkgewotCQlEUk1fRVJST1IoImZhaWxlZCB0byBjcmVhdGUgZmJjb24g
b2JqZWN0ICVkXG4iLCByZXQpOwotCQlyZXR1cm4gcmV0OwotCX0KLQotCXJibyA9IGdlbV90
b19yYWRlb25fYm8oZ29iaik7Ci0KLQkvKiByYWRlb24gcmVzdW1lIGlzIGZyYWdpbGUgYW5k
IG5lZWRzIGEgdnQgc3dpdGNoIHRvIGhlbHAgaXQgYWxvbmcgKi8KLQlyZGV2LT5kZGV2LT5t
b2RlX2NvbmZpZy5yZXF1aXJlX3Z0X3N3aXRjaF9mYmRldiA9IHRydWU7Ci0KLQkvKiBva2F5
IHdlIGhhdmUgYW4gb2JqZWN0IG5vdyBhbGxvY2F0ZSB0aGUgZnJhbWVidWZmZXIgKi8KLQlp
bmZvID0gZHJtX2ZiX2hlbHBlcl9hbGxvY19mYmkoaGVscGVyKTsKLQlpZiAoSVNfRVJSKGlu
Zm8pKSB7Ci0JCXJldCA9IFBUUl9FUlIoaW5mbyk7Ci0JCWdvdG8gb3V0OwotCX0KLQotCXJl
dCA9IHJhZGVvbl9mcmFtZWJ1ZmZlcl9pbml0KHJkZXYtPmRkZXYsICZyZmJkZXYtPmZiLCAm
bW9kZV9jbWQsIGdvYmopOwotCWlmIChyZXQpIHsKLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8g
aW5pdGlhbGl6ZSBmcmFtZWJ1ZmZlciAlZFxuIiwgcmV0KTsKLQkJZ290byBvdXQ7Ci0JfQot
Ci0JZmIgPSAmcmZiZGV2LT5mYjsKLQotCS8qIHNldHVwIGhlbHBlciAqLwotCXJmYmRldi0+
aGVscGVyLmZiID0gZmI7Ci0KLQltZW1zZXRfaW8ocmJvLT5rcHRyLCAweDAsIHJhZGVvbl9i
b19zaXplKHJibykpOwotCi0JaW5mby0+ZmJvcHMgPSAmcmFkZW9uZmJfb3BzOwotCi0JdG1w
ID0gcmFkZW9uX2JvX2dwdV9vZmZzZXQocmJvKSAtIHJkZXYtPm1jLnZyYW1fc3RhcnQ7Ci0J
aW5mby0+Zml4LnNtZW1fc3RhcnQgPSByZGV2LT5tYy5hcGVyX2Jhc2UgKyB0bXA7Ci0JaW5m
by0+Zml4LnNtZW1fbGVuID0gcmFkZW9uX2JvX3NpemUocmJvKTsKLQlpbmZvLT5zY3JlZW5f
YmFzZSA9IHJiby0+a3B0cjsKLQlpbmZvLT5zY3JlZW5fc2l6ZSA9IHJhZGVvbl9ib19zaXpl
KHJibyk7Ci0KLQlkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhpbmZvLCAmcmZiZGV2LT5oZWxw
ZXIsIHNpemVzKTsKLQotCS8qIHNldHVwIGFwZXJ0dXJlIGJhc2Uvc2l6ZSBmb3IgdmVzYWZi
IHRha2VvdmVyICovCi0JaW5mby0+YXBlcnR1cmVzLT5yYW5nZXNbMF0uYmFzZSA9IHJkZXYt
PmRkZXYtPm1vZGVfY29uZmlnLmZiX2Jhc2U7Ci0JaW5mby0+YXBlcnR1cmVzLT5yYW5nZXNb
MF0uc2l6ZSA9IHJkZXYtPm1jLmFwZXJfc2l6ZTsKLQotCS8qIFVzZSBkZWZhdWx0IHNjcmF0
Y2ggcGl4bWFwIChpbmZvLT5waXhtYXAuZmxhZ3MgPSBGQl9QSVhNQVBfU1lTVEVNKSAqLwot
Ci0JaWYgKGluZm8tPnNjcmVlbl9iYXNlID09IE5VTEwpIHsKLQkJcmV0ID0gLUVOT1NQQzsK
LQkJZ290byBvdXQ7Ci0JfQotCi0JRFJNX0lORk8oImZiIG1hcHBhYmxlIGF0IDB4JWxYXG4i
LCAgaW5mby0+Zml4LnNtZW1fc3RhcnQpOwotCURSTV9JTkZPKCJ2cmFtIGFwcGVyIGF0IDB4
JWxYXG4iLCAgKHVuc2lnbmVkIGxvbmcpcmRldi0+bWMuYXBlcl9iYXNlKTsKLQlEUk1fSU5G
Tygic2l6ZSAlbHVcbiIsICh1bnNpZ25lZCBsb25nKXJhZGVvbl9ib19zaXplKHJibykpOwot
CURSTV9JTkZPKCJmYiBkZXB0aCBpcyAlZFxuIiwgZmItPmZvcm1hdC0+ZGVwdGgpOwotCURS
TV9JTkZPKCIgICBwaXRjaCBpcyAlZFxuIiwgZmItPnBpdGNoZXNbMF0pOwotCi0JdmdhX3N3
aXRjaGVyb29fY2xpZW50X2ZiX3NldChyZGV2LT5wZGV2LCBpbmZvKTsKLQlyZXR1cm4gMDsK
LQotb3V0OgotCWlmIChmYiAmJiByZXQpIHsKLQkJZHJtX2dlbV9vYmplY3RfcHV0KGdvYmop
OwotCQlkcm1fZnJhbWVidWZmZXJfdW5yZWdpc3Rlcl9wcml2YXRlKGZiKTsKLQkJZHJtX2Zy
YW1lYnVmZmVyX2NsZWFudXAoZmIpOwotCQlrZnJlZShmYik7Ci0JfQotCXJldHVybiByZXQ7
Ci19Ci0KLXN0YXRpYyBpbnQgcmFkZW9uX2ZiZGV2X2Rlc3Ryb3koc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc3RydWN0IHJhZGVvbl9mYmRldiAqcmZiZGV2KQordm9pZCByYWRlb25fZmJk
ZXZfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIHsKLQlzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiA9ICZyZmJkZXYtPmZiOwotCi0JZHJtX2ZiX2hlbHBlcl91bnJlZ2lz
dGVyX2ZiaSgmcmZiZGV2LT5oZWxwZXIpOwotCi0JaWYgKGZiLT5vYmpbMF0pIHsKLQkJcmFk
ZW9uZmJfZGVzdHJveV9waW5uZWRfb2JqZWN0KGZiLT5vYmpbMF0pOwotCQlmYi0+b2JqWzBd
ID0gTlVMTDsKLQkJZHJtX2ZyYW1lYnVmZmVyX3VucmVnaXN0ZXJfcHJpdmF0ZShmYik7Ci0J
CWRybV9mcmFtZWJ1ZmZlcl9jbGVhbnVwKGZiKTsKLQl9Ci0JZHJtX2ZiX2hlbHBlcl9maW5p
KCZyZmJkZXYtPmhlbHBlcik7Ci0KLQlyZXR1cm4gMDsKLX0KLQotc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fZmJfaGVscGVyX2Z1bmNzIHJhZGVvbl9mYl9oZWxwZXJfZnVuY3MgPSB7Ci0J
LmZiX3Byb2JlID0gcmFkZW9uZmJfY3JlYXRlLAotfTsKLQotaW50IHJhZGVvbl9mYmRldl9p
bml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQotewotCXN0cnVjdCByYWRlb25fZmJk
ZXYgKnJmYmRldjsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IHJkZXYtPmRkZXY7CiAJ
aW50IGJwcF9zZWwgPSAzMjsKLQlpbnQgcmV0OwotCi0JLyogZG9uJ3QgZW5hYmxlIGZiZGV2
IGlmIG5vIGNvbm5lY3RvcnMgKi8KLQlpZiAobGlzdF9lbXB0eSgmcmRldi0+ZGRldi0+bW9k
ZV9jb25maWcuY29ubmVjdG9yX2xpc3QpKQotCQlyZXR1cm4gMDsKIAogCS8qIHNlbGVjdCA4
IGJwcCBjb25zb2xlIG9uIDhNQiBjYXJkcywgb3IgMTYgYnBwIG9uIFJONTAgb3IgMzJNQiAq
LwogCWlmIChyZGV2LT5tYy5yZWFsX3ZyYW1fc2l6ZSA8PSAoOCoxMDI0KjEwMjQpKQogCQli
cHBfc2VsID0gODsKLQllbHNlIGlmIChBU0lDX0lTX1JONTAocmRldikgfHwKLQkJIHJkZXYt
Pm1jLnJlYWxfdnJhbV9zaXplIDw9ICgzMioxMDI0KjEwMjQpKQorCWVsc2UgaWYgKEFTSUNf
SVNfUk41MChyZGV2KSB8fCByZGV2LT5tYy5yZWFsX3ZyYW1fc2l6ZSA8PSAoMzIqMTAyNCox
MDI0KSkKIAkJYnBwX3NlbCA9IDE2OwogCi0JcmZiZGV2ID0ga3phbGxvYyhzaXplb2Yoc3Ry
dWN0IHJhZGVvbl9mYmRldiksIEdGUF9LRVJORUwpOwotCWlmICghcmZiZGV2KQotCQlyZXR1
cm4gLUVOT01FTTsKLQotCXJmYmRldi0+cmRldiA9IHJkZXY7Ci0JcmRldi0+bW9kZV9pbmZv
LnJmYmRldiA9IHJmYmRldjsKLQotCWRybV9mYl9oZWxwZXJfcHJlcGFyZShyZGV2LT5kZGV2
LCAmcmZiZGV2LT5oZWxwZXIsCi0JCQkgICAgICAmcmFkZW9uX2ZiX2hlbHBlcl9mdW5jcyk7
Ci0KLQlyZXQgPSBkcm1fZmJfaGVscGVyX2luaXQocmRldi0+ZGRldiwgJnJmYmRldi0+aGVs
cGVyKTsKLQlpZiAocmV0KQotCQlnb3RvIGZyZWU7Ci0KLQkvKiBkaXNhYmxlIGFsbCB0aGUg
cG9zc2libGUgb3V0cHV0cy9jcnRjcyBiZWZvcmUgZW50ZXJpbmcgS01TIG1vZGUgKi8KLQlk
cm1faGVscGVyX2Rpc2FibGVfdW51c2VkX2Z1bmN0aW9ucyhyZGV2LT5kZGV2KTsKLQotCXJl
dCA9IGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWcoJnJmYmRldi0+aGVscGVyLCBicHBf
c2VsKTsKLQlpZiAocmV0KQotCQlnb3RvIGZpbmk7Ci0KLQlyZXR1cm4gMDsKLQotZmluaToK
LQlkcm1fZmJfaGVscGVyX2ZpbmkoJnJmYmRldi0+aGVscGVyKTsKLWZyZWU6Ci0Ja2ZyZWUo
cmZiZGV2KTsKLQlyZXR1cm4gcmV0OwotfQotCi12b2lkIHJhZGVvbl9mYmRldl9maW5pKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQotewotCWlmICghcmRldi0+bW9kZV9pbmZvLnJm
YmRldikKLQkJcmV0dXJuOworCS8qIHJhZGVvbiByZXN1bWUgaXMgZnJhZ2lsZSBhbmQgbmVl
ZHMgYSB2dCBzd2l0Y2ggdG8gaGVscCBpdCBhbG9uZyAqLworCWRkZXYtPm1vZGVfY29uZmln
LnJlcXVpcmVfdnRfc3dpdGNoX2ZiZGV2ID0gdHJ1ZTsKIAotCXJhZGVvbl9mYmRldl9kZXN0
cm95KHJkZXYtPmRkZXYsIHJkZXYtPm1vZGVfaW5mby5yZmJkZXYpOwotCWtmcmVlKHJkZXYt
Pm1vZGVfaW5mby5yZmJkZXYpOwotCXJkZXYtPm1vZGVfaW5mby5yZmJkZXYgPSBOVUxMOwor
CWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRkZXYsIGJwcF9zZWwpOwogfQogCiB2b2lkIHJh
ZGVvbl9mYmRldl9zZXRfc3VzcGVuZChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgaW50
IHN0YXRlKQogewotCWlmIChyZGV2LT5tb2RlX2luZm8ucmZiZGV2KQotCQlkcm1fZmJfaGVs
cGVyX3NldF9zdXNwZW5kKCZyZGV2LT5tb2RlX2luZm8ucmZiZGV2LT5oZWxwZXIsIHN0YXRl
KTsKKwlkcm1fZmJfaGVscGVyX3NldF9zdXNwZW5kKHJkZXYtPmRkZXYtPmZiX2hlbHBlciwg
c3RhdGUpOwogfQogCiBib29sIHJhZGVvbl9mYmRldl9yb2JqX2lzX2ZiKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX2JvICpyb2JqKQogewotCWlmICghcmRl
di0+bW9kZV9pbmZvLnJmYmRldikKKwlzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVy
ID0gcmRldi0+ZGRldi0+ZmJfaGVscGVyOworCisJaWYgKCFmYl9oZWxwZXIgfHwgIWZiX2hl
bHBlci0+YnVmZmVyKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoZ2VtX3RvX3JhZGVvbl9i
byhmYl9oZWxwZXItPmJ1ZmZlci0+Z2VtKSAhPSByb2JqKQogCQlyZXR1cm4gZmFsc2U7CiAK
LQlpZiAocm9iaiA9PSBnZW1fdG9fcmFkZW9uX2JvKHJkZXYtPm1vZGVfaW5mby5yZmJkZXYt
PmZiLm9ialswXSkpCi0JCXJldHVybiB0cnVlOwotCXJldHVybiBmYWxzZTsKKwlyZXR1cm4g
dHJ1ZTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21v
ZGUuaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21vZGUuaAppbmRleCA1Mjg4
ZGM3YTQ4OTcuLmEwZDNjZGY5ZjVkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fbW9kZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X21vZGUuaApAQCAtMjMwLDggKzIzMCw2IEBAIGVudW0gcmFkZW9uX2R2b19jaGlwIHsKIAlE
Vk9fU0lMMTE3OCwKIH07CiAKLXN0cnVjdCByYWRlb25fZmJkZXY7Ci0KIHN0cnVjdCByYWRl
b25fYWZtdCB7CiAJYm9vbCBlbmFibGVkOwogCWludCBvZmZzZXQ7CkBAIC0yNjgsOCArMjY2
LDYgQEAgc3RydWN0IHJhZGVvbl9tb2RlX2luZm8gewogCXN0cnVjdCBlZGlkICpiaW9zX2hh
cmRjb2RlZF9lZGlkOwogCWludCBiaW9zX2hhcmRjb2RlZF9lZGlkX3NpemU7CiAKLQkvKiBw
b2ludGVyIHRvIGZiZGV2IGluZm8gc3RydWN0dXJlICovCi0Jc3RydWN0IHJhZGVvbl9mYmRl
diAqcmZiZGV2OwogCS8qIGZpcm13YXJlIGZsYWdzICovCiAJdTE2IGZpcm13YXJlX2ZsYWdz
OwogCS8qIHBvaW50ZXIgdG8gYmFja2xpZ2h0IGVuY29kZXIgKi8KQEAgLTk3OSw4ICs5NzUs
NyBAQCB2b2lkIGRjZTRfcHJvZ3JhbV9mbXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
KTsKIHZvaWQgZGNlOF9wcm9ncmFtX2ZtdChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIp
OwogCiAvKiBmYmRldiBsYXllciAqLwotaW50IHJhZGVvbl9mYmRldl9pbml0KHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2KTsKLXZvaWQgcmFkZW9uX2ZiZGV2X2Zpbmkoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpOwordm9pZCByYWRlb25fZmJkZXZfaW5pdChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7CiB2b2lkIHJhZGVvbl9mYmRldl9zZXRfc3VzcGVuZChzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgaW50IHN0YXRlKTsKIGJvb2wgcmFkZW9uX2ZiZGV2
X3JvYmpfaXNfZmIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByYWRlb25f
Ym8gKnJvYmopOwogCi0tIAoyLjM2LjEKCg==

--------------SpYKGj0XuwQMViZQ81SY5gJe--

--------------f4nyaIGKAcrAmGKIVgMHeRi2--

--------------0zdDdSbiKmJIFKKz0x4Uqf20
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKxnKwFAwAAAAAACgkQlh/E3EQov+DV
pg//QEBNeC5sVp3aqlioKA5VTc1CWNal1Wi78emsLNy98wqB1hB4Ht3tfT4jNBBpqwBlc8lDXnsB
8lad7AckMrqD6WRbEjLkLqTZt3HRwJaHuXjj+rInPRoRFtsSfa3evY059M06ZRdHeEKgnGeSJ3TO
x56WezN7qvaLw/2E0oG8TdGqvJZ0JPFZOnBU1pErnZZ8ov8zpa7fKi0BUTo8Efh3DOR7LIyOUk6u
oAvbla2vUQEyHEXDZ8irZf0IRyPSuJiObxDURk6gFymnG3ZYNmlddTJKHOpx5L9N8uHgBOXIs2Lt
D6svyvLpCzUN5Y45udvcBYotaQH3BX4y8PhE8fRLs6R55KoN5aZkGH4ChyRNFnFI3+ZijRSR9Avv
xRZ9slnv3otWOIC05JwwyZc9OnBfO+LvEnVBYIRNWDwIZJJyWvzxVMZzIPHV9uE8Ym55strh5QyT
Jueq9Dm2dNsjkwXFsO6J7aR6Iuze3c95dMEFgioPKhg4JOXU6NRCoOG5y6UN98nqmDKC69Dapty3
GGWM2c8j+2XxzCzIzuRcHprnxqhfLEf8t9IYrTBhEusww8RXB62+/X4CAvB8+LpXQL3eKx3oGyGQ
AhCjTALgPhyOZtHF922/b15rFXDjMZuBDiFhY/uzhylz1PO3rMHzMWKeq9tGN06NYh9PxtwkieU9
GGE=
=zotD
-----END PGP SIGNATURE-----

--------------0zdDdSbiKmJIFKKz0x4Uqf20--
