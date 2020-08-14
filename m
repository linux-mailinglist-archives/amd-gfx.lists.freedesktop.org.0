Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9D244C55
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Aug 2020 17:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3185B6EB8E;
	Fri, 14 Aug 2020 15:53:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7656E0FD
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Aug 2020 15:53:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z18so8747080wrm.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Aug 2020 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RAkAfIMiJlTzPP1iS00g8lSFIF/M9NsTc0OFz+THYqU=;
 b=tV1Q0A6SbggCGV3Q1F62xkRv2OKiZ0AN1ueHDngdXuv1CLx0WEVrxf8yAUycFR/qZP
 tBdHre81cDGRWZmLa6GDZK2tWw3i7CryK1ON9F6Wqpc2YszXAhp+9HuIE7J6GnMHXDQw
 e0nInZl1cGgwd6ftgGWmxaQmk4UwCGdNcTMmdC6IXPigbHyDn9CY0bmPoyCLUwgQS4ua
 7tSShRcMAv3JfmGKLOVyxfSvbRTOcexWL/W6bmur4jIyXs5dOXRUa46ak9lukl3bnmzZ
 mWwS2jkHUfWVNFxrqdtu7TIQpRa0vaxK90GFbVFm9qj0JnBDdvxUSD2X0Ldm0JhGR122
 XFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RAkAfIMiJlTzPP1iS00g8lSFIF/M9NsTc0OFz+THYqU=;
 b=k0A2vUXPcnS3EEq6bXSwTN7al+5Ox89Zt7TEWk+3khGBO8sPRa9PatAa3V0JzXHSXH
 KrjM7qMMbsLGSm9BRr1DRnNtXyAdQvh6Yw/YuCGUg8Ht7BpITYGvwbM7B2haIXMSi+qs
 lnMBsHb43kf6iScr/Q4eL33vxeE8RV9dNStgo556IiRG+ZTQ4drS8I7ZA0lOeKAn4D/i
 pNDonsHAoVACw7fK7fY305yW50sQz3H7T2gE6XNtxXVUVdeVFsNr8t6uWDY4bJKp2mGg
 lnk/60E6lEyZ91YYOX0ikYqU3fvFb8ALL6VvD6GOuDcrHekc24XXh28nLHoWEGNBIgjp
 4N4A==
X-Gm-Message-State: AOAM530HbSWsJ3r4lwVP8smyptU6pyDSsbO553pPAVil6Cuu0en5DFNL
 kPhjNnY8X8WrbU2Ti8+sUaPY/lFZ6VW5mWHgsE8=
X-Google-Smtp-Source: ABdhPJz/P4XKXWrUiRZQ6WghYHZBwp1I7czv4HhM+qrjgaxxEPZxJlyzj12Oiwk3RcV5bEck4loBhGfperTFNt9DnIc=
X-Received: by 2002:adf:a351:: with SMTP id d17mr3229930wrb.111.1597420423400; 
 Fri, 14 Aug 2020 08:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <55620308-9334-e62e-4c45-01bcf61a82fa@suse.de>
 <c6de22a9-ee6c-333e-c625-1a8c08f66bee@amd.com>
In-Reply-To: <c6de22a9-ee6c-333e-c625-1a8c08f66bee@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Aug 2020 11:53:32 -0400
Message-ID: <CADnq5_MT_U2ZO-JSN1GLem6G43YAds7UOe56b=GOnN7Dpcd10w@mail.gmail.com>
Subject: Re: TTM/nouveau conflict in drm-misc-next
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTQsIDIwMjAgYXQgMTE6MjIgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEhleSBUaG9tYXMgJiBBbGV4LAo+Cj4gd2Vs
bCB0aGUgVFRNIGFuZCBOb3V2ZWF1IGNoYW5nZXMgbG9vayBnb29kIHRvIG1lLCBidXQgdGhpcyBj
b21wbGV0ZWx5Cj4gYnJva2UgYW1kZ3B1Lgo+Cj4gQWxleCBhbnkgaWRlYSB3aGF0IGlzIGdvaW5n
IG9uIGhlcmU/CgpXaGF0J3MgYnJva2VuIGluIGFtZGdwdT8gIFRoZXJlIHNob3VsZG4ndCBiZSBh
bnkgdHRtIGNoYW5nZXMgaW4gYW1kZ3B1CmZvciBkcm0tbmV4dC4gIFRob3NlIGFsbCBnbyB0aHJv
dWdoIGRybS1taXNjLgoKQWxleAoKPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4gQW0gMTIu
MDguMjAgdW0gMjE6MTAgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiA+IEhpIENocmlzdGlh
biBhbmQgQmVuLAo+ID4KPiA+IEkgYmFja21lcmdlZCBkcm0tbmV4dCBpbnRvIGRybS1taXNjLW5l
eHQgYW5kIGhhZCBhIGNvbmZsaWN0IGJldHdlZW4gdHRtCj4gPiBhbmQgbm91dmVhdS4gc3RydWN0
IHR0bV9tZW1fcmVzIGdvdCByZW5hbWVkIHRvIHN0cnVjdCB0dG1fcmVzb3VyY2UuIEkKPiA+IHVw
ZGF0ZWQgbm91dmVhdSB0byB0aGUgbmV3IG5hbWUsIHRlc3QtYnVpbHQsIGFuZCBwdXNoZWQgdGhl
IHJlc3VsdCB0bwo+ID4gZHJtLW1pc2MtbmV4dC4gSWYgZWl0aGVyIG9mIHlvdSBoYXMgYSBtaW51
dGUsIHlvdSBtYXkgd2FudCB0byBkb3VibGUKPiA+IGNoZWNrIHRoZSBtZXJnZS4KPiA+Cj4gPiBC
ZXN0IHJlZ2FyZHMKPiA+IFRob21hcwo+ID4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngK
