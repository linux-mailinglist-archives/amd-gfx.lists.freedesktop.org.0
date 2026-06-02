Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4lWpLpnsH2rpsQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 10:58:01 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D9635EB0
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 10:57:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=temperror ("DNS error when getting key") header.d=seu.edu.cn header.s=default header.b=ATen+nHh;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=temperror reason="SPF/DKIM temp error" header.from=seu.edu.cn (policy=temperror)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B8D10FADE;
	Wed,  3 Jun 2026 08:57:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-m9355.xmail.ntesmail.com (mail-m9355.xmail.ntesmail.com
 [103.126.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAEA10F004;
 Tue,  2 Jun 2026 12:03:54 +0000 (UTC)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ABsAYQCHKVHHoT1psMAfDKqi.3.1780401831750.Hmail.220255722@seu.edu.cn>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 kenneth.feng@amd.com, kevinyang.wang@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCAxLzJdIGRybS9hbWRncHUvbWVzMTE6IGZpeCBxdWV1ZSBpbml0IHdwdHIgcmVzZXQ=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
X-Originating-IP: 36.154.113.95
In-Reply-To: <6d0aba3d-2f53-453b-b5b1-39a0cf12c551@amd.com>
References: <20260602050354.2237095-1-runyu.xiao@seu.edu.cn>
 <20260602050354.2237095-2-runyu.xiao@seu.edu.cn>
 <bb4e417d-5669-4d06-a731-c9aa369f6bd7@amd.com>
 <AMgAqgBUKT9GR95Sm49u6arg.3.1780397583210.Hmail.220255722@seu.edu.cn>
 <6d0aba3d-2f53-453b-b5b1-39a0cf12c551@amd.com>
MIME-Version: 1.0
Received: from 220255722@seu.edu.cn( [36.154.113.95] ) by ajax-webmail (
 [127.0.0.1] ) ; Tue, 2 Jun 2026 20:03:51 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
Date: Tue, 2 Jun 2026 20:03:51 +0800 (GMT+08:00)
X-HM-Tid: 0a9e88336e9e02f2kunm3d6b082a172ae
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMdx4Gk9TojlCNw7tyeABf3pHtCqLbYOkFBtNuQ
 eKMqJLwxE4yuoq3Z/LDw3/nFtMApknDAcoIznsgK2cQHwtBBrhOyq0Xsi+/8ipSBwNbfOwu9byMH
 ug8FXgK1IHbIoUFR2eShRUAtSsCcoDnQYXX7E=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0tDVh1PQkMeSk1JHhkeTVYVFA
 kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTk9VSkpIVUJOWVdZFhoPEhUdFFlBWU9LSFVKS0
 hKTkxJVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
 b=ATen+nHhmsZu67KiAA9nkXRgXxlSkggRkSx3ii/UmDkVq1gKGbRnc8uY3LnyvhAJpJXCrL5bRi72Z75QLFBgCTJLBWKlXxJx4EHKo99IVgE+dyCZYwiqyi16wvnnIBsIr+K9DWT0u7NrtYtJXslquaG932Ffu0jVOkqs51V/G/E=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1; 
 bh=kuXh+OPAabOss1B3mKCT+V/+mkjtYYfzQUtWwO6Wzww=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Wed, 03 Jun 2026 08:57:50 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.99 / 15.00];
	SUBJ_EXCESS_BASE64(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,seu.edu.cn];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DMARC_DNSFAIL(0.00)[seu.edu.cn : SPF/DKIM temp error,none];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[seu.edu.cn:?];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_TEMPFAIL(0.00)[seu.edu.cn:s=default];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,seu.edu.cn:from_mime,seu.edu.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E42D9635EB0

CgpIaSBDaHJpc3RpYW4sCgoKVGhhbmtzLCB0aGF0IG1ha2VzIHNlbnNlLgoKCkkgd2lsbCByZXdv
cmsgdGhpcyBhcm91bmQgdHlwZWQgcnB0ci93cHRyX2NwdV9hZGRyIGFjY2Vzc2VzIGluc3RlYWQg
b2YKdGhlIGF0b21pYzY0X3QgY2FzdCwgYW5kIEkgd2lsbCBpbmNsdWRlIHRoZSByZWxhdGVkIHJw
dHIgZml4ZXMgaW4gdGhlCnNhbWUgcGF0Y2ggc2V0LgoKClRoYW5rcywKUnVueXUKPj4gCQo+PiAK
Pj4gSGkgQ2hyaXN0aWFuLAo+PiAKPj4gVGhhbmtzLCB1bmRlcnN0b29kLgo+PiAKPj4gVG8gbWFr
ZSBzdXJlIEkgcmV3b3JrIHRoaXMgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbjogd291bGQgeW91IGV4
cGVjdAo+PiB0aGlzIHJlc2V0IHBhdGggdG8gZG8KPj4gCj4+IMKgIHJpbmctPndwdHIgPSAwOwo+
PiDCoCBhbWRncHVfcmluZ19zZXRfd3B0cihyaW5nKTsKPj4gCj4+IGluc3RlYWQgb2Ygd3JpdGlu
ZyB3cHRyX2NwdV9hZGRyIGRpcmVjdGx5Pwo+PiAKPj4gSSBhbSBhc2tpbmcgYmVjYXVzZSBhbWRn
cHVfcmluZ19zZXRfd3B0cigpIGFsc28gdXBkYXRlcyB0aGUgZG9vcmJlbGwsCj4+IHNvIEkgd2Fu
dCB0byBjb25maXJtIHRoYXQgdGhpcyBpcyB0aGUgaW50ZW5kZWQgc2VxdWVuY2UgZm9yIHRoZQo+
PiByZXNldC9zdXNwZW5kIGNhc2UgaGVyZS4KPgo+WWVhaCBJIHdhcyB3b25kZXJpbmcgdGhlIHNh
bWUgdGhpbmcuCj4KPkkgdGhpbmsgdGhlIGNvcnJlY3QgYXBwcm9hY2ggd291bGQgYmUgdG8gbWFr
ZSBib3RoIHJwdHJfY3B1X2FkZHIgYW5kIHdwdHJfY3B1X2FkZHIgdm9pZCogaW4gdGhlIGFtZGdw
dV9yaW5nLmggc3RydWN0dXJlIGluc3RlYWQgb2YgdTMyKiBhbmQgdGhlbiBjYXN0IHRoYXQgdG8g
ZWl0aGVyICh1NjQqKSBvciAodTMyKikgZGVwZW5kaW5nIG9uIHRoZSByaW5nIHR5cGUuCj4KPlRo
ZSBhdG9taWM2NF90IGhhY2sgc2hvdWxkIHJlYWxseSBiZSByZW1vdmVkLgo+Cj5CVFcgUmVhZGlu
ZyB0aGUgcnB0ciBpcyB3cm9uZyBvbiBtdWx0aXBsZSBpbnN0YW5jZXMgYXMgd2VsbCBhbmQgc2hv
dWxkIHByb2JhYmx5IGJlIGZpeGVkIGluIHRoZSBzYW1lIHBhdGNoIHNldC4KPgo+UmVnYXJkcywK
PkNocmlzdGlhbi4KPgo+PiAKPj4gVGhhbmtzLAo+PiBSdW55dQo+PiAKPj4gT24gVHVlLCBKdW4g
MiwgMjAyNiBhdCAxMTo0OTowNUFNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4g
Q2xlYXIgTkFLLgo+Pj4KPj4+IFRoZSBhdG9taWM2NF90IGNhc3QgaGFjayBpcyBqdXN0IHNvbWV0
aGluZyB3ZSBkaWQgZm9yIG9sZGVyCj4+PiBnZW5lcmF0aW9ucyBhbmQgaXMgbm90IHNvbWV0aGlu
ZyB3aGljaCBpcyBuZWNlc3Nhcnkgbm9yIHNob3VsZAo+Pj4gYmUgZG9uZSBoZXJlLgo+Pj4KPj4+
IFdoYXQgY291bGQgYmUgcG9zc2libGUgaXMgdGhhdCB3ZSBuZWVkIHRvIHVzZSBhbWRncHVfcmlu
Z19zZXRfd3B0cigpCj4+PiBoZXJlIHRvIGNvcnJlY3RseSBkaXN0aW5ndWlzaCBiZXR3ZWVuIHF1
ZXVlcyB3aXRoIDMyYml0IGFuZCA2NGJpdAo+Pj4gd3B0cnMuCj4+IAo+Cj4KCj4+IAkKPj4gCj4+
IEhpIENocmlzdGlhbiwKPj4gCj4+IFRoYW5rcywgdW5kZXJzdG9vZC4KPj4gCj4+IFRvIG1ha2Ug
c3VyZSBJIHJld29yayB0aGlzIGluIHRoZSByaWdodCBkaXJlY3Rpb246IHdvdWxkIHlvdSBleHBl
Y3QKPj4gdGhpcyByZXNldCBwYXRoIHRvIGRvCj4+IAo+PiDCoCByaW5nLT53cHRyID0gMDsKPj4g
wqAgYW1kZ3B1X3Jpbmdfc2V0X3dwdHIocmluZyk7Cj4+IAo+PiBpbnN0ZWFkIG9mIHdyaXRpbmcg
d3B0cl9jcHVfYWRkciBkaXJlY3RseT8KPj4gCj4+IEkgYW0gYXNraW5nIGJlY2F1c2UgYW1kZ3B1
X3Jpbmdfc2V0X3dwdHIoKSBhbHNvIHVwZGF0ZXMgdGhlIGRvb3JiZWxsLAo+PiBzbyBJIHdhbnQg
dG8gY29uZmlybSB0aGF0IHRoaXMgaXMgdGhlIGludGVuZGVkIHNlcXVlbmNlIGZvciB0aGUKPj4g
cmVzZXQvc3VzcGVuZCBjYXNlIGhlcmUuCj4KPlllYWggSSB3YXMgd29uZGVyaW5nIHRoZSBzYW1l
IHRoaW5nLgo+Cj5JIHRoaW5rIHRoZSBjb3JyZWN0IGFwcHJvYWNoIHdvdWxkIGJlIHRvIG1ha2Ug
Ym90aCBycHRyX2NwdV9hZGRyIGFuZCB3cHRyX2NwdV9hZGRyIHZvaWQqIGluIHRoZSBhbWRncHVf
cmluZy5oIHN0cnVjdHVyZSBpbnN0ZWFkIG9mIHUzMiogYW5kIHRoZW4gY2FzdCB0aGF0IHRvIGVp
dGhlciAodTY0Kikgb3IgKHUzMiopIGRlcGVuZGluZyBvbiB0aGUgcmluZyB0eXBlLgo+Cj5UaGUg
YXRvbWljNjRfdCBoYWNrIHNob3VsZCByZWFsbHkgYmUgcmVtb3ZlZC4KPgo+QlRXIFJlYWRpbmcg
dGhlIHJwdHIgaXMgd3Jvbmcgb24gbXVsdGlwbGUgaW5zdGFuY2VzIGFzIHdlbGwgYW5kIHNob3Vs
ZCBwcm9iYWJseSBiZSBmaXhlZCBpbiB0aGUgc2FtZSBwYXRjaCBzZXQuCj4KPlJlZ2FyZHMsCj5D
aHJpc3RpYW4uCj4KPj4gCj4+IFRoYW5rcywKPj4gUnVueXUKPj4gCj4+IE9uIFR1ZSwgSnVuIDIs
IDIwMjYgYXQgMTE6NDk6MDVBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IENs
ZWFyIE5BSy4KPj4+Cj4+PiBUaGUgYXRvbWljNjRfdCBjYXN0IGhhY2sgaXMganVzdCBzb21ldGhp
bmcgd2UgZGlkIGZvciBvbGRlcgo+Pj4gZ2VuZXJhdGlvbnMgYW5kIGlzIG5vdCBzb21ldGhpbmcg
d2hpY2ggaXMgbmVjZXNzYXJ5IG5vciBzaG91bGQKPj4+IGJlIGRvbmUgaGVyZS4KPj4+Cj4+PiBX
aGF0IGNvdWxkIGJlIHBvc3NpYmxlIGlzIHRoYXQgd2UgbmVlZCB0byB1c2UgYW1kZ3B1X3Jpbmdf
c2V0X3dwdHIoKQo+Pj4gaGVyZSB0byBjb3JyZWN0bHkgZGlzdGluZ3Vpc2ggYmV0d2VlbiBxdWV1
ZXMgd2l0aCAzMmJpdCBhbmQgNjRiaXQKPj4+IHdwdHJzLgo+PiAKPgo+Cg==
