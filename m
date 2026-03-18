Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLBDLvTFu2nEoAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Mar 2026 10:46:28 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8DB2C8F71
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Mar 2026 10:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2810E945;
	Thu, 19 Mar 2026 09:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tZiWVFHj";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A8710E120
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Mar 2026 14:31:26 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso4401012f8f.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Mar 2026 07:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844285; cv=none;
 d=google.com; s=arc-20240605;
 b=GfvuRms0Dco0lb36jwWP4TS4wgEk4O14XrSvjX9fIVg1NtkzDBoJ0aHULakdKR11Ag
 p2fuHscQpyb0Ncu8bWSuWChJyXSRzP+L7pa/Giuu6gZgpbMB0o5XQqMOEDsBwQPpqusT
 IPVwjNaDJicLEnLyZdI6rVkOFgOhUpDpzgPKXFD8JPea1lMdO7Msz1913u7wEg8Ih5Ys
 eF0Ko6vK8+sp97WuHE7J0+ZCWeBPg7DCHZv4H0+qTfy/cUqms807P7g8PqkmYuNIii7f
 XH7cdWBr3Z1/oS2ghBa/jwa0Dq3LditHZ6e7ujx1O8Absz0u7hKH5dMukN6VkdOE6l3V
 GJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
 fh=QZesh3aT39A9zgu8MyNbw3tfZCmuwuT4z/HXx3X6Qpc=;
 b=lZfCWtXuSAaxYPRSoJPxF9hHCIZFwnO8EnaOSAJMqaG1usgOUk6Pzpkq6uhAr9g097
 DBTJjEYHvMAPjmb59f+bgZ6onoAPiVgteczr5Pco/XLZzIcy45RnCaytEnS0hxlQb7mo
 qHCceY0c1Fa5dS2/vBfJMVdZszoUq57R7ns4DlRMwXTM9FMdnyDM83DgN2V/OpZlf2Oj
 /mMgHb8Hixr6+sxIjivSK+1sVSDPwbHMB9fyo95C16Gsxyyc7aUXWxtye8zSB0GuTSD0
 fKEE1TVguk+frJlAHh+Oe9x40VjZayUlRApOlBCoiypTeBYfQW6KXCXVMlnS62vYlBfw
 /USA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773844285; x=1774449085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
 b=tZiWVFHj2+g9DuubpbvnUXJzjWS5yRLIEcmLhSkfowhQcU3h/pW3rjvyiXbGjc+J/c
 yMXzCnq5OHsbQLHh4+cBCjDzAMD/CWOZz+ZIib1V9AfKHxoUg6I6Sstd6ZwvHtXhhnvu
 Le9Pe1kBpFN1rF8CWmgr+R2SZT1/2+bgHO9STvNDgbH0RHMrGJvOWtiSDTBHKi1Up97I
 Vm4gFHYOBRIfifX6Of4PjHpHX1fogGRo6PaqPa/7hsv56sri5qan9WKTEzb7iMUUV6Uo
 rlE1gPcXYzpDPNPYKYLtupYS2L64GX0H45xTr4ip0Ra8LQNhT46Mvpvy9/Da4Nb8lTwp
 ZVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773844285; x=1774449085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
 b=hF7LZXvWWBdf1/aXwIMns2wk1lYVJO6nyzvQQV/+T46ZQqPW/R0kyfcH6IX97aRKLE
 yAiIi8KB31+3MzkdGX7KKMz1rNgw9t/1acifysmdaWNkmIISDs3HOGaWgIhhDcy5lpyL
 8wEyeqQrS2Pz9WVwy9RvtAAc1xQI4QSCU3gad0ZIAs9K3u9IgEtAMnrUXFFL57McT03j
 /MZtFet8AojlV0blUf5yu/yqqM3gRCZ4MS6saqnX39IOeLnraqyrDJW8orEVApVSEOHk
 /3Co47EwxhcZP3RoVE5VqS7Nmq766dsyStOqgETtIugJvOobA0xhZiWYM+pw6pZLECrv
 hG1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTnBZtGT2v3ls4P2o5i6WvBk8LjUQNentk0crBJYND8iHpcm3gL0MH7VCqjNkAc+GcRzxWmsk4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvOh/Nzh01ymoJUAO/Wvhta4Uey24uIAiSu3LesVJEWG7kAz42
 CpXpZ4B+pE7m4lh0xtFGAvVbdQm6d3jXz/Rj0UKsJkAFMlJ9XpnwMVBYxyLzDwD/BG5o8db7803
 HMp/b2R+zpMhNsTIi1lEU09BZq/9IZy2cPyf+W7Qx
X-Gm-Gg: ATEYQzwkYOGryYQGiTv8q58dVVWq7oDrWRuonrS80EiMPvWDMbxe51cVf3O9Mxi13yL
 QhP4sRqIagOgw9H/Pyd7nIwSs/uWkrOAeQucY3jnkKeOeP4MZWZ2KMMGTGgn+w7F+YuB1FP/7qs
 YV/Ks4id12d2OOBUB4SeyORryDvHBR41SqfiTg1U8pIeiJsAg+bggJ3K4zNDJzbXHAoB+OV5KXZ
 fW1M9bwTe2p7Z6YkYGvOUtQFf0UtYkjgvgb8K1UHHpbgfdrhT0qsHFpt7j9JDcxBEBLmkbKJ+tG
 4PBZcl+h/I86QY7/ebLtWCwuL2AyuipEdxCiXPWsYZ4s5TeAdv8sxXvGhC496ttzUc35Yg==
X-Received: by 2002:a5d:5f43:0:b0:439:ca85:8848 with SMTP id
 ffacd0b85a97d-43b527aa344mr6004289f8f.16.1773844284463; Wed, 18 Mar 2026
 07:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
 <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
In-Reply-To: <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Mar 2026 15:31:12 +0100
X-Gm-Features: AaiRm51O3ZORqMPG2oSnP3bbIvsHXlypg7QXuPo86XIFyKOog2BgXzbGuVDuzJY
Message-ID: <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 19 Mar 2026 09:46:17 +0000
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:acourbot@nvidia.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:alex.gaynor@gmail.com,m:dakr@kernel.org,m:airlied@redhat.com,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:ndjukic@nvidia.com,m:phasta@kernel.org,m:elle@weathered-steel.dev,m:corbet@lwn.net,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:deller@gmx.de,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:epeer@nv
 idia.com,m:arighi@nvidia.com,m:aritger@nvidia.com,m:zhiw@nvidia.com,m:balbirs@nvidia.com,m:alexeyi@nvidia.com,m:ecourtney@nvidia.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:miguelojedasandonis@gmail.com,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0E8DB2C8F71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 3:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> [*] I would have preferred a middle ground like  modules being inside
> but repeating the folder name, e.g. `.../pci/pci.rs`, but I doubt that
> will ever be supported upstream since one probably wants to support
> the other ways at the same time.

In principle this is possible using

#[path =3D "pci/pci.rs"]
pub mod pci;

Alice
