Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7OTmEGkESGoijgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 20:50:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897DF705002
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 20:50:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=adiF7C3l;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14DA10E663;
	Fri,  3 Jul 2026 18:50:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978DF10E663
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Jul 2026 18:50:13 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49241dbf9c1so6908745e9.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 03 Jul 2026 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783104612; x=1783709412; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1pbMO9q4O124KT6Be0ZSe5VmRy/7//LxDSmLrSqBhhA=;
 b=adiF7C3lSC7vAUDvis19Y10HnNN8qppUY1oaSfsRuJsYxbRWbK73/CqbHs4pljJFOI
 tCRQwu1ieoDKKvVBNvTJ/a2up9LOQrvooEsDw31tNBSFTN3d4WWirJGmdDJEmkRcH2fZ
 /OK18xwQlCUTwLOp4nH5bNgJ88klZRmwTxOtdyzsNckKQdh9KY/wfab7npEYoDoVEk3h
 E1s7o3CjUZwcK7BEohXZ+fhH2WmnUmCM+ahdWASU2vIRv3u8Qss6X8H1u6iW2HctlXNq
 fPo6On8s6I2KNZojFOPcbo6lpgTW4YYsgXs9kIJO+GmXe7DyDClGu470wfrvr+wA9ykc
 MEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783104612; x=1783709412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1pbMO9q4O124KT6Be0ZSe5VmRy/7//LxDSmLrSqBhhA=;
 b=EADbQnCCUixMzRQrEILLcQ+m82pctb+lPCjt5orjTdbo7n6eacSIGBTsuOP1du4k5Z
 5WF1u2V8LDby7Ztl4Tcsk7Cn38JkgeXkriaPJDvGMUDLjQ5HbtgjFARaAJ5yVcV1AKK0
 Xq8DS9VA0sbWJFnF3nyWlB6UiHQ79ilyOzZxJcSA6RJRQmYy5hfO+AJZi+TX3SannlhE
 iToq/nXyVhXVwL1CrVEze5nGVeaxcD0w3Ipfy2XVzigPTJF25oJrVuQo7nCZgT8eh/6X
 qpAKf1VssZeQuWC32L2F5diEww2ZnHpZ9H1UCUMQRggMXgn49c4aQeohECmgr6xKnMLQ
 Sv1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1uCWnjSxIbqO8KhdFQhp7Za+cquEHrKTOXbXlo0jOcn6O7EFaTV+nx5HBOH98FEa9evh8TfAo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF3krVX86jc4ZqC09eHk/XeZ/Me7Sb4Px83mHR4tGC6NnPJaqh
 7aB7YO2l6pqGLwYcqsf4E2kQJTrkbKJba8Y30B2s00DMRo6QeIPvlIBh
X-Gm-Gg: AfdE7ckyPxq1EFV3Y1voaYKhgbiYWwpSHwDtoS2E3Bt3g0F8e1MOZo3ZfEyhaZaBUDE
 1zVY3z8FCRH5lwR4HK9xdlPHjNBonpLczLjWLpJOxnpXhV+AuWdiDAujeJD8nhtASJxIG9SxLmx
 JnLaUDAIEgT2AszZFF8V0u+3IfsBEGAFL/XyxF1CYcyBMkfkuCjXX+PBPssGCwBbKCdlZilVteR
 tZolXCwvzV2yjas+hccpcj0SAfGbcK6Gt5X3vSoPb880apJUNlRN9dDqqECfIaMuXQJaEUt+xxl
 L4ZWuTQmT5S+yXZUIV1UDYfAk4mIcr1WsnK+rvLvDd3kwg2HopOHm7hEytiAhqyMUttYA7/8kiQ
 BW/Ye+h+QX73CCXG7V7t1nRFo9ZxBnS5ET9R+F5MeeM+8k+8C3L23R0X9gu7ZXUdqZy7GmvpQFj
 UXBysfMkqpnOOEhmaLMVbjXP4imVRT0aPu/ySu86kBQ3ZPSS7fFUISw9N0zIl49R7HtUBzt3vgD
 UmVv3pzWyr8LFxo+6g=
X-Received: by 2002:a05:600c:3e18:b0:493:ad8a:e7fd with SMTP id
 5b1f17b1804b1-493d11d7fd6mr4907195e9.14.1783104611805; 
 Fri, 03 Jul 2026 11:50:11 -0700 (PDT)
Received: from timur-max.localnet
 (20014C4E24D8E500AC9DAEE3E0CDFA47.dsl.pool.telekom.hu.
 [2001:4c4e:24d8:e500:ac9d:aee3:e0cd:fa47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce040b4sm92491775e9.10.2026.07.03.11.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:50:11 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, "Shetaia, Amir" <Amir.Shetaia@amd.com>,
 Marek =?UTF-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, "He, Siwei" <Siwei.He@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>, "Joshi, Mukul" <Mukul.Joshi@amd.com>
Subject: Re: [PATCH 11/14] drm/amdgpu/ih6.0: Use MMIO ACK for retry CAM on IH
 6.0
Date: Fri, 03 Jul 2026 20:50:09 +0200
Message-ID: <3014087.Ex9A2HvPv6@timur-max>
In-Reply-To: <BL3PR12MB6425A9D4631A637C778F6BACEEF42@BL3PR12MB6425.namprd12.prod.outlook.com>
References: <20260701161721.85681-1-timur.kristof@gmail.com>
 <4547ddd3-974a-4c9c-8fec-939dc132f7d0@amd.com>
 <BL3PR12MB6425A9D4631A637C778F6BACEEF42@BL3PR12MB6425.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Christian.Koenig@amd.com,m:Alexander.Deucher@amd.com,m:natalie.vock@gmx.de,m:Amir.Shetaia@amd.com,m:maraeo@gmail.com,m:Mario.Limonciello@amd.com,m:tursulin@ursulin.net,m:Felix.Kuehling@amd.com,m:Lijo.Lazar@amd.com,m:Siwei.He@amd.com,m:Philip.Yang@amd.com,m:Mukul.Joshi@amd.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,lists.freedesktop.org,gmx.de,gmail.com,ursulin.net];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,timur-max:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 897DF705002

On 2026. j=C3=BAlius 3., p=C3=A9ntek 20:11:59 k=C3=B6z=C3=A9p-eur=C3=B3pai =
ny=C3=A1ri id=C5=91 Joshi, Mukul=20
wrote:
> > I still haven't found any explanation why we use a doorbell for the CAM=
 in
> > the first
> place? Lijo, Alex, Felix does anybody know that?
> >
>=20
> If I remember correctly, we weren't sure if the IH_RETRY_CAM_ACK register
> would be available under
> virtualization. And we were sure doorbells would
> work for both bare-metal and virtualization.=20

Hi Mukul,

Can you clarify that please?

How are retry faults supposed to work under virtualization? Is the interrup=
t=20
processed by the guest or the host? Why is the IH_RETRY_CAM_ACK register no=
t=20
available under virtualization?

Thanks & best regards,
Timur



