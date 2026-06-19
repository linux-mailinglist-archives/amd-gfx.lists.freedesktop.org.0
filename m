Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CLLrIziHNWr3ygYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 20:15:20 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B7C6A758B
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 20:15:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G47KPXIU;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A07D10F6CB;
	Fri, 19 Jun 2026 18:15:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1225210E0E9
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 18:15:17 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-59eb57ea1e1so125505e0c.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 11:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781892916; cv=none;
 d=google.com; s=arc-20240605;
 b=KnNrmxe9sJkjqbqvS5QBnKyZhLEzbr4nTWeA+nzIPhWKEj4fivAUt7zgpw8bOC4EBZ
 SHMOyviXT1Fr8dAnG0E5dN2xJlrdu2ZrJgSEhN5xLsObbGk33otiCVuhpRGzacAtJuBm
 80dCv3OGt9hj7AA9gP/TCc+zPsi+/JwVnhWiXjfIZelB93RQYIIJKGMIssHV8Z7wk0sI
 GONroC98ImxqadZrZYPDYsgiRg21fhRmFu4EZlsLj5EfLDqtmxuDN2RjOU6ATVRCC3fT
 mJDZHC7dVdODSKm3Cw24xkyWhpI99i3zWjhw7nuehWoHX8tu0IsBdzDM6Df7Gc4CU6a2
 m2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dXCHkr/buYhbFjbuGOxsQCc9tZxaLEjgHz9PgjJKgGc=;
 fh=bQ24ny33UkgbCNdbjc6GiOnoH/A89V6RQXM2qW5bGvM=;
 b=XV7sPYiq7DdXzaflfx/t/RFWW2gyNisnsvV2YIAj+BU+9+hW7vYSji5Wn68BU6iQ9e
 R4nqDjtBx/sdOK0VoichlGO6VDpp/OVkVQMvyyok6EtG/wJRv+cML7OplOQfh1nba8rw
 UUAhAmPagUnOvTR/PJrFFxI2rNac6asLg9+4YKNceO/8Q/PhXaC2wiClqM5xKVu3GRIV
 semq1c25lG1x1oi+vVZvTvz0dzNXFGV8b+3rTcu1scPvrTuuYRQArNwPbKTXHAsE4a43
 3I7DA2LHzLLnCcdBTT8+cPrr9jrrYLmb8WfC2AMqRdN8Ba00HH8vL1jDKcLD/7ZC4h9A
 dXqQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781892916; x=1782497716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXCHkr/buYhbFjbuGOxsQCc9tZxaLEjgHz9PgjJKgGc=;
 b=G47KPXIUtnlqmHBHQWs+NoFqooABMjhzg4+FW6EME4CO0cksxKhtItz0+TpyTutdT4
 aFUAOtFHFreBUnb1D7bRbp8diJHUJlx9uxEWUGBhK4gpSQwH7GcfuzoI5szCq29NWPH9
 +WHM2oPnqrB4Rj94gFQxnLuRjcqbDMKgkUeQYuDTQ02eBucEU9qtubdnzsYRA5Xc2kcd
 5X10bmObzykUfP8Y0PBDdim9ZWtOowwCQFdOMsVBwPqsGADfw5a/hkMc2nvBoSQYKJR1
 lgU3fB1q/2SEzjT44sA9liA3tTDdNxV5mrP/63uz6j9fIhnMnCgA0lPMp2vEX1qg5QnM
 TsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781892916; x=1782497716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dXCHkr/buYhbFjbuGOxsQCc9tZxaLEjgHz9PgjJKgGc=;
 b=qKx8cefSvCq6+DErKpWhfVSPuymps5GXftvC5xVTZCBfJwiWjxGeb50m8oy9RryHYl
 DgmC9TQRJ0I2qjIBtSL8zhcN6ksSX1br+3jFGjYtUGURiRl6zBomqdXlR0m5RpxXa3mN
 A7KXnc9hSY4s29fv4xMsakLT1pBjm+84VmItg433xgh1AeAjn2XY1zMgoXKGs8GwqbIr
 2OAfMXvaQuG5Aen40a30VZmW6t8qUzqULF+DVRp81CdpJb8//q9SqPWPMYikOkV3Q17d
 KX9avrAXnRx67U1NGgWjMKDNEPpnb5FhTz4CYMml30hhCOnsa+iEbKpaQOKfmYcp4I+D
 s22A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gbUUebeqnd7FEY0Ij9rCjlA5yFsWZpGDfEnwdXDjozfXtfwWYnYSKtnoXpu18onnx19lMvY5p@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZjlwbP3hDh1urOz9xBLLHgD9vDUtC485aLIngHQv7wXg8knUj
 OWS2/euX5RRK5iI6e2kRt+iFYCgrjwiPct/8ohejpHA7fH+ZWV5jN/LxkF/1xqdp9dHBtHzSStq
 r6mvmZ6Qv6Geyl4D90VSkGs4gzfNSuX0=
X-Gm-Gg: AfdE7ck/Py/DHg+09L3kP18PNQbOw396cklovr0e0MDe5oVji3SCMbY2UJNae9AoUPV
 bsaWQR/kdKR9Z/APzPLxyiUa1ioPQj1xB8aGnia1/uS+mc1iNU8oIbJz+/IsasMBrOGyTM+LggF
 y3vqZn6XPVjqtV0mwvJO716HuokJnNgt82MlW1a2UgbofA9iCyCT5glMfrJ3X9mBdlbxo2lUWnK
 huW6ZSALwi2x4tweDXdGkZSVB+M4cNtIoqrgs4TxDWaF+qv5otFgKxGuhYrAg5VwcIN7mYeeH8V
 e2EFDW5+wjsEw+3bSXyL0OyW4/SrUw5jvz6GL9NWk2d2/zcYBiWQ43mBWk8=
X-Received: by 2002:a05:6102:2910:b0:60f:77ad:4bed with SMTP id
 ada2fe7eead31-72a0522b667mr1183972137.7.1781892915745; Fri, 19 Jun 2026
 11:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <kb82H17fFzuBQ-ZxQz8SJqF6DPycZtYEc7XvSWxR0nww24pZJTnkYUU_d8bbJpqC34uGL7IhIPFznw4nMYtzozBZCxxTWBgjjA3gTdR49Fc=@pm.me>
In-Reply-To: <kb82H17fFzuBQ-ZxQz8SJqF6DPycZtYEc7XvSWxR0nww24pZJTnkYUU_d8bbJpqC34uGL7IhIPFznw4nMYtzozBZCxxTWBgjjA3gTdR49Fc=@pm.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Jun 2026 14:15:03 -0400
X-Gm-Features: AVVi8CcszhTy_CieaRCNsTgj0FgI5-NvsoCo3Sc5CZGJL8eWvZ0DhI0VF4mcEyE
Message-ID: <CADnq5_M+A0C6cQmkwG3Kt_AOQEgxB9+iGaq8E8p-XPnKakMLpg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: support a couple of extra BARCO graphics
 adapters
To: feralmatt@pm.me
Cc: Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:feralmatt@pm.me,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3B7C6A758B

On Fri, Jun 19, 2026 at 1:54=E2=80=AFPM Matthew Jacob <feralmatt@pm.me> wro=
te:
>
>
>
> BARCO produces its own adapters using AMD chipsets. Mostly they are used =
on Windows platforms for radiology PACS review workstations. They don't wan=
t to spend resources to support Linux. Working with them unofficially joint=
ly with Kaiser who is experimenting with Linux as an alternate platform I g=
ot some patches to support some of the cards that Kaiser has in its fleets =
in several regions. Neither Kaiser nor BARCO have any objection to inclusio=
n of these changes in Linux.
>
> Changes attached.
>

So you can retain authorship, can you send this as a proper git patch
with your signed-off-by?

Thanks,

Alex
