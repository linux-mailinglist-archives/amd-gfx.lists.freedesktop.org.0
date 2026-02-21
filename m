Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF4UGDASnGna/QMAu9opvQ:T3
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 09:39:13 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86817323A
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 09:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB26C10E28B;
	Mon, 23 Feb 2026 08:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A1cMOCoR";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A927B10E12D
 for <amd-gfx@lists.freedesktop.org>; Sat, 21 Feb 2026 05:56:01 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-65c0d2f5fe1so4505818a12.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 21:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771653360; cv=none;
 d=google.com; s=arc-20240605;
 b=HAK01A+Y9e9zWH7vBpZdiejQyaWalpbdLDJqq5yW58by48wxRYx0kHLto5mtC4bVyw
 PQWPorgi2JMYMqJVJTBRE5IF7CWSBm5ZJxCPEHf6rZf2b8wRN3ehz0B9haCZcwwqrH46
 bxuw0kFmZTmtQCXYwhVBqRgeDbpzSPGszuFK5/mqYl/1F9fuzRfCDkbCLr5gQvAPla8f
 oc+RDp6SiZ2cT0ifYGwRcrRBCAt4BYdDr5jaIsx9Wm9xnJwGZ8skwQZMP2hkEJd7ijfv
 rQX3zuonbEWCq5CtJqgdTYQyetxGyzhhAjEppVXaLKK2Vc/Xh3pZSjVu5vJ75apF950x
 jRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ccv9mwt6mLX9xX+lxZglunKn+JwfoIDQEFEaLtcrLyQ=;
 fh=qxFDSN4KNTe7ismVfqiXI4oCVVKa2go5uc6/u3Jg+Yc=;
 b=M/yM9BSXfbkvRiP3EAcacyHOs0tMEhn15D3vuher5yurHVHOcmy4Gigs0OMgzZCplS
 cHMBcY5j3X02qCVEifdMIfNcUDu+zJ9YuOZvpwDX6xLFQQTtBXGkyB0CN5KLVjwQCI3e
 kbNupbtK4vEIzF6Y73A2edVCf0jKJYrPXY3PtCPOL4fcMLBJV5SXwxAnJTK77YCNtx7i
 H7QFmydWqbOqJQ8Gnzce8smgqQCD59mjLPRpzzCtQw8GaPQAk592U7LK5bzwO4NDymzW
 APb4Woxxyi2MV6ilmOv0ttmluvAuC88giwzF/RMChcGQTY+bKkawCXSiJ4p0zyvJFgqN
 TRZg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771653360; x=1772258160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ccv9mwt6mLX9xX+lxZglunKn+JwfoIDQEFEaLtcrLyQ=;
 b=A1cMOCoRjBnQsBmsQeR/sta1GgHoX5V7AV5+DHynhrx9By4p4p5T/8jyfUlc1lpCi9
 huiE85MBSarpYBcO59rkMM7YTviOo2EPyx4MT7svmLTFxT5Fp1e4naqAXvXYagi3qKsS
 T7yzvAVwU9R8nwESAG2rsB1uTv0Y3MmS2JC6nE0f5vHrEUd85JUdx+C0ID2HEdHGWWkO
 eGv6Be3WmutYTH9hjfbU691NDzM+xE5sYGzXil+CcWTLy1y5Smjo6Bf4qGOZryASAvcy
 U42WM3BlKtxxV6JazURouaLly7syrkU0X5I5nWzIwttClb8ZP2oIDu7bTg/Ey/z0xddq
 k66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771653360; x=1772258160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ccv9mwt6mLX9xX+lxZglunKn+JwfoIDQEFEaLtcrLyQ=;
 b=D/gHjh1OjJoIebZwRnShMqo4aXJsz3frgG/uCdjNBaTEzHxlGC41x9Cd2/llrmt/DQ
 jlnHld1LMO2qk8WALlwBHZWnSvakXLNOYplJ7lafZzQ4z3oL13LmjucDI+W5LukRWT/d
 16JQ4AKa3xTTwtZAHOHenE2zXYsLHoR1eGh9xA47vEpFEasJOmkpge9VKUqk9rM1Lo8v
 Lvfy238RXL5PeASxjuXbb1SIaA/1gRLe8JXouX6Q66Jk/GnAdHh+BwHgeE3OQlK0Ke+7
 7/0epSbYDtaBBbLvoDZvuLn0JD/SUGR+OyCwF0WJOvPj9j6Jje/tikhZ+sOv9u4Q+f4v
 vPOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeWLBXMD/QtPqa3CLlQs8NX2Rqjn6GfiK56sB/AW+SWnuBmD3aL15bu7e30W5VYa6SK2HGb2Mj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCgTqLLHWaj1CvEAI4+XaGAglNpxum32UsPySFzgALRl4Lv9ao
 pUdkAWEiNaIcwZFcyu2lzXRe0P8wk0ZVfEKj5y1Vo24mtM4VUgTbLMnfWduT5zUCaRIBe/an4U4
 coaEcwrK7b9ONjeN49UgYju5flIS2eio=
X-Gm-Gg: AZuq6aLbO16z2TDUv89+hj+4ToRlgSDoCYDwFP+aR5qqYRXslQekxk2ay5iEoSZjQmx
 J7uyUcmTQGJlo/7BW4YO3Bhzd65IDYM3hCIWDLBmpVu928U55wT1NnXfkcDgxntzn7zyJU6S8Z1
 Uo1t+/yBYGi/jhEm3jlYtqubndyMGS7N6UwZzXi5lwKck9lIqNqKpTmZejSKM+PAV848NtvrLWo
 VUYFKmWzisFJkDtCX16tnMS/i4AQtw/MhtzYW9fi+taznhMMFZ3kJINRg+k8H1THyXCqaXxUNpD
 AshWMjZvv6XTkjDzSjGTBjSmZnQGcT5kFcrLrlzYBOSdnCoXpN+S6IbO2ykpcqEakYKjkqqoXwN
 epzcjZQ==
X-Received: by 2002:a17:906:fd85:b0:b86:f558:ecc0 with SMTP id
 a640c23a62f3a-b9081b4d0ecmr105154766b.29.1771653359889; Fri, 20 Feb 2026
 21:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20260221034402.69537-1-rosenp@gmail.com>
 <2026022126-calculate-matador-e7bd@gregkh>
In-Reply-To: <2026022126-calculate-matador-e7bd@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Feb 2026 21:55:48 -0800
X-Gm-Features: AaiRm52sd4wHVH4fvoty83VydXFtxyvYUG7iNjF0rTjocALxFyz7eMIIRUKgihM
Message-ID: <CAKxU2N_+88yrYYv6B+VMSkSgpVBBBFiHo1e_yXV6FWX-bLw9nQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] 6.12 and below: amdgpu: fix panic with SI and DC
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "open list:AMD POWERPLAY AND SWSMU" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Feb 2026 08:29:06 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DATE_IN_PAST(1.00)[50];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7D86817323A
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 9:41=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Feb 20, 2026 at 07:44:00PM -0800, Rosen Penev wrote:
> > The first commit is needed for the second one to be reverted cleanly.
> >
> > The second breaks DC support on my AMD 7750. Kernel panics and I get a
> > black screen on boot. With these two reverted, 6.12 is usable again.
> >
> > Tried to git cherry-pick the fixes but that proved to be difficult to
> > do cleanly.
> >
> > I see 6.6 also has these two commits.
> >
> > Not sure what the proper procedure is to request reverts on stable
> > kernels.
>
> Close, see my comments on the first patch.
OK. I'll wait a bit before resubmitting.
>
> thanks,
>
> greg k-h
