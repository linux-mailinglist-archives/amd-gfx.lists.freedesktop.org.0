Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC54349C3D
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Mar 2021 23:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B58D6E0E7;
	Thu, 25 Mar 2021 22:30:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486A86E0E7
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Mar 2021 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616711427;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vz9NyzDOrKu4TkpeOBZ8oedQNWuIVzf7kNFtSvoiYII=;
 b=XMQSuHOU5jh2OS9kfslcFWoLQB7UT8Q6KwFI0N0TAc/7QbRofjovmHryhJaLLYP5uBKQFM
 njqnpzeldaxHXDbo7vr+onZNvu/gaWLmiUgYMAALGvmwg9rkhuWtjcz28la/YQBD3uXZLD
 TWUPOy1RAepTur24rEpCGqEvduIXnJk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-JccLkqKsP2qdrr1HS-fElQ-1; Thu, 25 Mar 2021 18:30:25 -0400
X-MC-Unique: JccLkqKsP2qdrr1HS-fElQ-1
Received: by mail-qt1-f199.google.com with SMTP id s14so4160537qtw.20
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Mar 2021 15:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=vz9NyzDOrKu4TkpeOBZ8oedQNWuIVzf7kNFtSvoiYII=;
 b=k9C47bWVt6wBjIUFKfHc0XqIgzBsWMN7wnUfX/BXUs/MiSFa8zE9rX24jkbdSqKpmo
 v7KctLnRiaipsEO2GeBLx41cYd66S9mlDDAkV+hQztZcK5F72Q51tl5A0Vo0cdQdfvyz
 Sxuqj1FjceGMeCQhaK2KVrw7HlqjG7r3NpK++mDUrp5gqYilEU0J7z39TE1cPC5eqKCy
 IpROrjcVqsZpz3+v74N7U1niZbHTgwhK18SVAgGoMLFL6nePACNlVuMZalo/J0cDEkqX
 7SN5IX+ZvmJE6LICTt2rtfMK++6j4BFi3PVoO4oqS7Mck5onuKSOyRLdtf4E02K8cqlC
 3rEQ==
X-Gm-Message-State: AOAM533gh5PUBvWv49B7G8abKPe+vrjz+If1uYRClcNgDFjt/FflDk3g
 f9ww9JSwsg9hbZF49jAjIovUx7gAKTxp6HOKjB048MSjZww53Hm+dpuBwx2uRZRyEvhaS6XIm9J
 CmCrXZoBnZLJfXn/MxVgwiXF0Kw==
X-Received: by 2002:a0c:cb0c:: with SMTP id o12mr10642228qvk.54.1616711425040; 
 Thu, 25 Mar 2021 15:30:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNpFzngbKnwACv0JF8v3Ome0RTzi9KkSSK+7eA7v9d/ne8ucgwe5xkW4EBCvPOYa/LWwL7iA==
X-Received: by 2002:a0c:cb0c:: with SMTP id o12mr10642212qvk.54.1616711424860; 
 Thu, 25 Mar 2021 15:30:24 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p186sm5270189qka.66.2021.03.25.15.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 15:30:24 -0700 (PDT)
Message-ID: <c9148c206727761644c31844f929d52ca19d00ee.camel@redhat.com>
Subject: Re: [PATCH v2] drm/mst: Enhance MST topology logging
From: Lyude Paul <lyude@redhat.com>
To: Eryk Brol <eryk.brol@amd.com>, manasi.d.navare@intel.com,
 daniel@ffwll.ch,  harry.wentland@amd.com, rodrigo.siqueira@amd.com,
 nicholas.kazlauskas@amd.com,  jerry.zuo@amd.com, wayne.lin@amd.com
Date: Thu, 25 Mar 2021 18:30:23 -0400
In-Reply-To: <20210325180614.37060-1-eryk.brol@amd.com>
References: <20210325180614.37060-1-eryk.brol@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpMZXQgbWUga25vdyBp
ZiB5b3UgbmVlZCBtZSB0byBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dCBmb3IgeW91CgpPbiBU
aHUsIDIwMjEtMDMtMjUgYXQgMTQ6MDYgLTA0MDAsIEVyeWsgQnJvbCB3cm90ZToKPiBbd2h5XQo+
IE1TVCB0b3BvbG9neSBwcmludCB3YXMgbWlzc2luZyBmZWMgbG9nZ2luZyBhbmQgcGR0IHByaW50
ZWQKPiBhcyBhbiBpbnQgd2Fzbid0IGNsZWFyLiB2Y3BpIGFuZCBwYXlsb2FkIGluZm8gd2FzIHBy
aW50ZWQgYXMgYW4KPiBhcmJpdHJhcnkgc2VyaWVzIG9mIGludHMgd2hpY2ggcmVxdWlyZXMgdXNl
ciB0byBrbm93IHRoZSBvcmRlcmluZwo+IG9mIHRoZSBwcmludHMsIG1ha2luZyB0aGUgbG9ncyBk
aWZmaWN1bHQgdG8gdXNlLgo+IAo+IFtob3ddCj4gLWFkZCBmZWMgbG9nZ2luZwo+IC1hZGQgcGR0
IHBhcnNpbmcgaW50byBzdHJpbmdzCj4gLWZvcm1hdCB2Y3BpIGFuZCBwYXlsb2FkIGluZm8gaW50
byB0YWJsZXMgd2l0aCBoZWFkaW5ncwo+IC1jbGVhbiB1cCB0b3BvbG9neSBwcmludHMKPiAKPiAt
LS0KPiAKPiB2MjogQWRkcmVzc2VkIEx5dWRlJ3MgY29tbWVudHMKPiAtbWFkZSBoZWxwZXIgZnVu
Y3Rpb24gcmV0dXJuIGNvbnN0Cj4gLWZpeGVkIGluZGVudGF0aW9uIGFuZCBzcGFjaW5nIGlzc3Vl
cwo+IAo+IFNpZ25lZC1vZmYtYnk6IEVyeWsgQnJvbCA8ZXJ5ay5icm9sQGFtZC5jb20+Cj4gLS0t
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNTkgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMK
PiBpbmRleCA5MzJjNDY0MWVjM2UuLmRlNTEyNGNlNDJjYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC00NzIwLDYgKzQ3MjAsMjggQEAgc3RhdGljIHZvaWQg
ZHJtX2RwX21zdF9raWNrX3R4KHN0cnVjdAo+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3Ip
Cj4gwqDCoMKgwqDCoMKgwqDCoHF1ZXVlX3dvcmsoc3lzdGVtX2xvbmdfd3EsICZtZ3ItPnR4X3dv
cmspOwo+IMKgfQo+IMKgCj4gKy8qCj4gKyAqIEhlbHBlciBmdW5jdGlvbiBmb3IgcGFyc2luZyBE
UCBkZXZpY2UgdHlwZXMgaW50byBjb252ZW5pZW50IHN0cmluZ3MKPiArICogZm9yIHVzZSB3aXRo
IGRwX21zdF90b3BvbG9neQo+ICsgKi8KPiArc3RhdGljIGNvbnN0IGNoYXIgKnBkdF90b19zdHJp
bmcodTggcGR0KQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3dpdGNoIChwZHQpIHsKPiArwqDCoMKg
wqDCoMKgwqBjYXNlIERQX1BFRVJfREVWSUNFX05PTkU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiAiTk9ORSI7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUF9QRUVSX0RF
VklDRV9TT1VSQ0VfT1JfU1NUOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gIlNPVVJDRSBPUiBTU1QiOwo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFBfUEVFUl9ERVZJQ0Vf
TVNUX0JSQU5DSElORzoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuICJN
U1QgQlJBTkNISU5HIjsKPiArwqDCoMKgwqDCoMKgwqBjYXNlIERQX1BFRVJfREVWSUNFX1NTVF9T
SU5LOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gIlNTVCBTSU5LIjsK
PiArwqDCoMKgwqDCoMKgwqBjYXNlIERQX1BFRVJfREVWSUNFX0RQX0xFR0FDWV9DT05WOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gIkRQIExFR0FDWSBDT05WIjsKPiAr
wqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gIkVSUiI7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICt9Cj4gKwo+IMKgc3RhdGljIHZvaWQg
ZHJtX2RwX21zdF9kdW1wX21zdGIoc3RydWN0IHNlcV9maWxlICptLAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGRybV9kcF9tc3RfYnJhbmNoICptc3RiKQo+IMKgewo+IEBAIC00NzMyLDkgKzQ3NTQsMjAgQEAg
c3RhdGljIHZvaWQgZHJtX2RwX21zdF9kdW1wX21zdGIoc3RydWN0IHNlcV9maWxlICptLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJlZml4W2ldID0gJ1x0JzsKPiDCoMKgwqDC
oMKgwqDCoMKgcHJlZml4W2ldID0gJ1wwJzsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHNlcV9wcmlu
dGYobSwgIiVzbXN0OiAlcCwgJWRcbiIsIHByZWZpeCwgbXN0YiwgbXN0Yi0+bnVtX3BvcnRzKTsK
PiArwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRmKG0sICIlc21zdGIgLSBbJXBdOiBudW1fcG9ydHM6
ICVkXG4iLCBwcmVmaXgsIG1zdGIsIG1zdGItCj4gPm51bV9wb3J0cyk7Cj4gwqDCoMKgwqDCoMKg
wqDCoGxpc3RfZm9yX2VhY2hfZW50cnkocG9ydCwgJm1zdGItPnBvcnRzLCBuZXh0KSB7Cj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlcV9wcmludGYobSwgIiVzcG9ydDogJWQ6IGlu
cHV0OiAlZDogcGR0OiAlZCwgZGRwczogJWQgbGRwczoKPiAlZCwgc2RwOiAlZC8lZCwgJXAsIGNv
bm46ICVwXG4iLCBwcmVmaXgsIHBvcnQtPnBvcnRfbnVtLCBwb3J0LT5pbnB1dCwgcG9ydC0KPiA+
cGR0LCBwb3J0LT5kZHBzLCBwb3J0LT5sZHBzLCBwb3J0LT5udW1fc2RwX3N0cmVhbXMsIHBvcnQt
Cj4gPm51bV9zZHBfc3RyZWFtX3NpbmtzLCBwb3J0LCBwb3J0LT5jb25uZWN0b3IpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRmKG0sICIlc3BvcnQgJWQgLSBbJXBd
ICglcyAtICVzKTogZGRwczogJWQsIGxkcHM6ICVkLAo+IHNkcDogJWQvJWQsIGZlYzogJXMsIGNv
bm46ICVwXG4iLCAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcHJlZml4LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwb3J0LT5wb3J0X251bSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydC0+aW5wdXQgPyAiaW5wdXQiIDogIm91
dHB1dCIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHBkdF90b19zdHJpbmcocG9ydC0+cGR0KSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydC0+ZGRwcywKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydC0+bGRwcywKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydC0+bnVtX3Nk
cF9zdHJlYW1zLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwb3J0LT5udW1fc2RwX3N0cmVhbV9zaW5rcywKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydC0+ZmVjX2NhcGFibGUgPyAidHJ1
ZSIgOiAiZmFsc2UiLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwb3J0LT5jb25uZWN0b3IpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKHBvcnQtPm1zdGIpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZHJtX2RwX21zdF9kdW1wX21zdGIobSwgcG9ydC0+bXN0Yik7Cj4gwqDC
oMKgwqDCoMKgwqDCoH0KPiBAQCAtNDc4NywzMyArNDgyMCwzNyBAQCB2b2lkIGRybV9kcF9tc3Rf
ZHVtcF90b3BvbG9neShzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4
X3VubG9jaygmbWdyLT5sb2NrKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKCZt
Z3ItPnBheWxvYWRfbG9jayk7Cj4gLcKgwqDCoMKgwqDCoMKgc2VxX3ByaW50ZihtLCAidmNwaTog
JWx4ICVseCAlZFxuIiwgbWdyLT5wYXlsb2FkX21hc2ssIG1nci0+dmNwaV9tYXNrLAo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZ3ItPm1heF9wYXlsb2Fkcyk7Cj4gK8KgwqDCoMKg
wqDCoMKgc2VxX3ByaW50ZihtLCAiXG4qKiogVkNQSSBJbmZvICoqKlxuIik7Cj4gK8KgwqDCoMKg
wqDCoMKgc2VxX3ByaW50ZihtLCAicGF5bG9hZF9tYXNrOiAlbHgsIHZjcGlfbWFzazogJWx4LCBt
YXhfcGF5bG9hZHM6ICVkXG4iLAo+IG1nci0+cGF5bG9hZF9tYXNrLCBtZ3ItPnZjcGlfbWFzaywg
bWdyLT5tYXhfcGF5bG9hZHMpOwo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgc2VxX3ByaW50ZihtLCAi
XG58wqDCoCBpZHjCoMKgIHzCoCBwb3J0ICMgfMKgIHZjcF9pZCB8ICMgc2xvdHMgfMKgwqDCoMKg
IHNpbmsKPiBuYW1lwqDCoMKgwqAgfFxuIik7Cj4gwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7
IGkgPCBtZ3ItPm1heF9wYXlsb2FkczsgaSsrKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAobWdyLT5wcm9wb3NlZF92Y3Bpc1tpXSkgewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNoYXIgbmFtZVsxNF07Cj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwb3J0ID0gY29udGFp
bmVyX29mKG1nci0+cHJvcG9zZWRfdmNwaXNbaV0sIHN0cnVjdAo+IGRybV9kcF9tc3RfcG9ydCwg
dmNwaSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ZmV0Y2hfbW9uaXRvcl9uYW1lKG1nciwgcG9ydCwgbmFtZSwgc2l6ZW9mKG5hbWUpKTsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlcV9wcmludGYobSwg
InZjcGkgJWQ6ICVkICVkICVkIHNpbmsgbmFtZTogJXNcbiIsIGksCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3J0
LT5wb3J0X251bSwgcG9ydC0+dmNwaS52Y3BpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VxX3ByaW50ZihtLCAiJTEwZCUxMGQlMTBkJTEwZCUyMHNc
biIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydC0+cG9ydF9udW0sCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwb3J0LT52Y3BpLnZjcGksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydC0+dmNwaS5udW1fc2xvdHMs
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAoKm5hbWUgIT0gMCkgPyBuYW1lIDrCoCAiVW5rbm93biIpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKCpuYW1lICE9IDApID8gbmFtZSA6ICJVbmtub3duIik7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9IGVsc2UKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNlcV9wcmludGYobSwgInZjcGkgJWQ6dW51c2VkXG4iLCBpKTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlcV9wcmludGYo
bSwgIiU2ZCAtIFVudXNlZFxuIiwgaSk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDC
oMKgwqBzZXFfcHJpbnRmKG0sICJcbioqKiBQYXlsb2FkIEluZm8gKioqXG4iKTsKPiArwqDCoMKg
wqDCoMKgwqBzZXFfcHJpbnRmKG0sICJ8wqDCoCBpZHjCoMKgIHzCoCBzdGF0ZcKgIHzCoCBzdGFy
dCBzbG90wqAgfCAjIHNsb3RzIHxcbiIpOwo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBp
IDwgbWdyLT5tYXhfcGF5bG9hZHM7IGkrKykgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzZXFfcHJpbnRmKG0sICJwYXlsb2FkICVkOiAlZCwgJWQsICVkXG4iLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRmKG0sICIlMTBkJTEwZCUxNWQlMTBkXG4i
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1nci0+cGF5bG9hZHNbaV0ucGF5bG9hZF9zdGF0ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1nci0+cGF5bG9hZHNbaV0uc3RhcnRfc2xv
dCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1nci0+cGF5bG9hZHNbaV0ubnVtX3Nsb3RzKTsKPiAtCj4gLQo+IMKgwqDCoMKgwqDCoMKgwqB9
Cj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmbWdyLT5wYXlsb2FkX2xvY2spOwo+IMKg
Cj4gK8KgwqDCoMKgwqDCoMKgc2VxX3ByaW50ZihtLCAiXG4qKiogRFBDRCBJbmZvICoqKlxuIik7
Cj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJm1nci0+bG9jayk7Cj4gwqDCoMKgwqDCoMKg
wqDCoGlmIChtZ3ItPm1zdF9wcmltYXJ5KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1OCBidWZbRFBfUEFZTE9BRF9UQUJMRV9TSVpFXTsKCi0tIApTaW5jZXJlbHksCiAgIEx5
dWRlIFBhdWwgKHNoZS9oZXIpCiAgIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKICAgCk5v
dGU6IEkgZGVhbCB3aXRoIGEgbG90IG9mIGVtYWlscyBhbmQgaGF2ZSBhIGxvdCBvZiBidWdzIG9u
IG15IHBsYXRlLiBJZiB5b3UndmUKYXNrZWQgbWUgYSBxdWVzdGlvbiwgYXJlIHdhaXRpbmcgZm9y
IGEgcmV2aWV3L21lcmdlIG9uIGEgcGF0Y2gsIGV0Yy4gYW5kIEkKaGF2ZW4ndCByZXNwb25kZWQg
aW4gYSB3aGlsZSwgcGxlYXNlIGZlZWwgZnJlZSB0byBzZW5kIG1lIGFub3RoZXIgZW1haWwgdG8g
Y2hlY2sKb24gbXkgc3RhdHVzLiBJIGRvbid0IGJpdGUhCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngK
