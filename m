Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MNZtAI69RGrUzwoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 09:11:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0F6EA82A
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 09:11:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="nSg/MP0h";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DC110EDFF;
	Wed,  1 Jul 2026 07:11:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D6310E269
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 21:10:50 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-13b20620476so12782c88.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 14:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782853850; cv=none;
 d=google.com; s=arc-20260327;
 b=Ir6sJ6hIXvPYOGd3i8gmnIP7QQix8p/atEy0pRD8y7R3F8C9EODKq1MXJwI7eGFtHt
 AXr9Jms9ejVlC22fa+U3wfLqmCQ4KkkEReKAaVsuOBgpveKNpXaK3NRI3/1UYJAIuKb2
 aIR7gSj8tOokGss/DvD/j/pTHD3oMgp5tRm/MKYgSth78WSlN5y0HdW6gpLT330Ioi/e
 YXFDOUDuOyn0X17NlPlF7tEFmJvKMf1nW+CwHUSzvYR9c33TVe2hiI2TzBTHAqC7aDb4
 Sedto26UQpmoriTK/myFh4n/KbhD4gd5DpucZDBenCcYTu3+o8IjOrhmkLdGYkQn8EEU
 Y4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7SSqL1E+p7WgGd8ZO/9M9ZdneV3Ml3dOx3/qlpyHxCQ=;
 fh=IZz3X4osmxS36Y7VJjJugOXSjor+sjbvrUZSYnSJqfU=;
 b=RU9cEYO3QpkX8Fe723ZmbsnqlW4r9AleF7lidRaqvL5uP3LNNvnCjYrEsUADEFM7s3
 78Qs5Bp5r9XP/y4/uxMsq+EMQ9LjR/E8yUcmjQ0bKqNjRhU4nWK9rvFeCw6mNaw53neR
 okrrngZYu/eTSeB9k5SKmCFapcNrClI8ky8eZVhZbRNGdLmK51fNEc3hcbA0cR9RWDgV
 dNs8Y1qLfX6USBWoNR+50NUEzgCIjLGr3/UETMLlfFkGse743lyT4fB2sKBlHghLfEGC
 YSewQV+yAyxr3klWRSCy7LBWs+vudfllLLeL+tBRPeVxQI8XixWsLfySBg7rB5h/Z564
 1Ulg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782853850; x=1783458650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7SSqL1E+p7WgGd8ZO/9M9ZdneV3Ml3dOx3/qlpyHxCQ=;
 b=nSg/MP0hvZaMCT90L34XoNdYrRhU3rDNjWr5MDP6F99FqVh+iiAgLijisfGNIUG9Jg
 JsDvlviymjF6COk5KgUJnhdEjB8tf7870ck9h5+NHX8/eISSFtyo4Jnf88SrAvsfeqWe
 U/jTCg8X8wO4BEhBKvYoUyRJbMj8kB14dsEiNZV9R3x2mOppHS5AgfGYfAkJfcH6DR/R
 MhHQuahiAWDDY0wSepMry3dBSht+ghMPz8u0Bi3GhglLO3qYn+CLF4J/kGM2sGJpsswz
 fR6X4uPKxPMJURahnw72VGB1ayLARxWIXmO187HRkP3EPCsSMWNsisqii6BrjN5vYMVF
 xaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782853850; x=1783458650;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7SSqL1E+p7WgGd8ZO/9M9ZdneV3Ml3dOx3/qlpyHxCQ=;
 b=fiGzDMntsdsYUc6Jl2I9R8SZOpJfOPsfyhwRvkooxuLdeczjj3vywaJsAgp0pGkrqc
 FJ67bhDgArapXPBt+ZC2IqeGWiey83jnOY7ZCbee7Bbopuci/SvRtXK6cxz2hlQO1D8H
 bGCdX3P95RSmghfvWspG2/AK3/6avHwVaxoVm0VraXSJ9Iz/jllw7xQvVhvTDEY+cgvc
 GQ05QxNxPMNsqC/EEnp45hliwrWxVXKHOxi24WsJ+tHEHY0UF+MYaRQU4tMKyiGTdkA0
 iaac7t/V6sjmit3xPvoK8fQEulexA3xL8dl5JAguZzE4NX83KQ5cCJG7cT67ZJFrgRQ7
 p6UA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PapltKM0V5rabWTtWnlAitkzEVgJeW0+ybF+gSg4TRp0hHolFbNXIRmIP4Y9AKSlh2BnPvzZc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXQejTye56Uz5EdvkMoNwIiImbAq2PVd5TP9tn2f1qQRogHQd1
 dmDlwzeMxZG2cr4qyc581bLqLHpfan7JUjP89gHI8OZqAxPdgYrNdgqrrZMtzme0L17ty/mOGLq
 qNEKUuclK1iVyBBqExgXQwuF7Ps59yHY=
X-Gm-Gg: AfdE7cm72cSnlT3DX22vH2mrs8sb0C/20cRLFvzxNDwXgfwpkIT790HUsNw1A6hqIVZ
 epZwzuyRnALes3e+jHZaBW0w0EhhsHWuXKZM/9Zr1rhI/uqqgreeMQpcUkQ/7ChLqC4E0XWjeRB
 63W/jbqbTVDAlZYg5mDhv7Zeqm24ZhH1QLUeCCUXulQjBDyhk2+NFeZ2GIjtpvmXAs1rKnSeLCV
 p88G+zkimx3vxphYMqTuU5j+YCGASiqDSxF8YtYnfPiN4h0qCOzEbHj4kQxnNXvGBSSKaLNyj9e
 4zO/M5nSa3BLx591aZkzr/ly0GxHIB9Iq6k7nx53hndVcct3UEYk/vfk9V0HllgYcxAyX2AvJFX
 tMPjYaUAvt2Y4
X-Received: by 2002:a05:7022:688b:b0:137:e391:1ae2 with SMTP id
 a92af1059eb24-13b2a1ab955mr1757879c88.6.1782853849895; Tue, 30 Jun 2026
 14:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260630210445.23103-1-breno3011alves@gmail.com>
In-Reply-To: <20260630210445.23103-1-breno3011alves@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 23:10:37 +0200
X-Gm-Features: AVVi8Cfjoi3T3EKFkCwXhsv0BrkYg3IOIGvLrRnFevnovSKeBOUhSVdqZIWPxgE
Message-ID: <CANiq72nFchJZVE8sr=oRnh8wR_DxefJNBUV=OwOs7hShZXApTQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: core: implement rx580 state optimization engine
 and c-to-rust char dev
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: alexander.deucher@amd.com, gregkh@linuxfoundation.org, ojeda@kernel.org, 
 christian.koenig@amd.com, arnd@arndb.de, rust-for-linux@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 01 Jul 2026 07:11:03 +0000
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:breno3011alves@gmail.com,m:alexander.deucher@amd.com,m:gregkh@linuxfoundation.org,m:ojeda@kernel.org,m:christian.koenig@amd.com,m:arnd@arndb.de,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70A0F6EA82A

On Tue, Jun 30, 2026 at 11:04=E2=80=AFPM Breno Rodrigues Alves
<breno3011alves@gmail.com> wrote:
>
> diff --git a/Documentation/rust/alves_guidelines.rst b/Documentation/rust=
/alves_guidelines.rst
> new file mode 100644
> index 000000000..f6afa63de
> --- /dev/null
> +++ b/Documentation/rust/alves_guidelines.rst
> @@ -0,0 +1,3 @@
> +# Rust for Linux - Core Guidelines
> +- Style: Linear, pragmatic, flat, Linus Torvalds style.
> +- Constraints: Zero-cost abstractions, strict RAII, no binary bloat.

What is this? And how is it possible that you changed this file (and
also tested the typo) within minutes of v2 submission?

Is this submission generated with AI? Please see:

  https://docs.kernel.org/process/generated-content.html
  https://docs.kernel.org/process/coding-assistants.html

Please observe the ~week delay between submissions. Also please add
changelogs for your submissions etc. Please see:

  https://docs.kernel.org/process/submitting-patches.html

Thanks!

Cheers,
Miguel
