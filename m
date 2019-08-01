Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCB57E346
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705F46E795;
	Thu,  1 Aug 2019 19:25:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740055.outbound.protection.outlook.com [40.107.74.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7966E794
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:25:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDXOR/Es78iPMFEqmI+XM9IRvTfE0/B54fyaBKnyG57P68dz4d+h9Cyy/LCwFyFbru3STvnLM7WZnDlWs0bh30wtgZfjL4zG+MOjZ02jm90bLo0njZNNQh9MupLfuBZ5uwi4uWHu5ZFLjowosKR+jmOtXG6+288HUexTHUYCtB9790RvpUDD1fyacXvbCbrop6toLCRRPI2gFfuaJd4huwTDKbbJa+z6v5CAAjEx0po2+V5ht/LFKhMZCg/S/9AvP9iHP1/mWb9mUnPhZK9z6UOhPl5uR3aoOZti55M75pT1ISCEeh5S+iQ0occREPOvqBc8G2P+n/vfiB6rYD879Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqO7qoXSiT1YwdearIGASzfkApqweSwT01xYVwegwnY=;
 b=GQeEnK6nOYFIsXglNn9GQfWP6LV25rjOPYwJBfAdHQHAz2PHN1nyO0hKyskr7RfQFWTcs5DRV4qZ4T5oq612j5Iye26ASYgh2C7cwIuBe9KkbSjQbhDwNGx+yGGHRs0Y6Mi7NMWM2k1z5lcNrxVS2pxFlVDBJ06xFtVu0YsXK6i5/RHdxHDHjFfxLJ9p/vmxePLs0nbSCCys1TUroS5Z2UFwaKarIfjgDQRq9ROyIH5sC8T6tvfhztq6bgL9afs1nRWDMXCC0CdPGS1QZVkqeXZV9uDbuou9ALiCyHZj8C+nVlK9GS9DgMPvNDZzBJ/whXLciukg2euwMmj9C1Ig6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.65.149) by
 BN8PR12MB2993.namprd12.prod.outlook.com (20.178.208.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Thu, 1 Aug 2019 19:25:30 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::3492:27b4:40cc:44b7]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::3492:27b4:40cc:44b7%6]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 19:25:30 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Don't replace the dc_state for fast
 updates
Thread-Topic: [PATCH 3/3] drm/amd/display: Don't replace the dc_state for fast
 updates
Thread-Index: AQHVR7yyxOmh22rB2kO8XtFmy8vPL6bmpt0AgAAHFLA=
Date: Thu, 1 Aug 2019 19:25:30 +0000
Message-ID: <BN8PR12MB3217433D27E25905A31FC8EFEFDE0@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190731162604.28509-1-nicholas.kazlauskas@amd.com>
 <20190731162604.28509-3-nicholas.kazlauskas@amd.com>,
 <CADnq5_O+v6GC+DYOXkPRwT6S9tjiRs9uNEntS4wdCZVTUpmdAA@mail.gmail.com>
In-Reply-To: <CADnq5_O+v6GC+DYOXkPRwT6S9tjiRs9uNEntS4wdCZVTUpmdAA@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1a210a2-1d57-4aa0-698d-08d716b60424
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2993; 
x-ms-traffictypediagnostic: BN8PR12MB2993:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN8PR12MB2993C33C9F82F0E6549B70BCEFDE0@BN8PR12MB2993.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(199004)(189003)(68736007)(7736002)(186003)(110136005)(6436002)(52536014)(54906003)(26005)(76116006)(55016002)(606006)(14454004)(91956017)(15650500001)(6636002)(316002)(4326008)(478600001)(99286004)(8936002)(6606003)(74316002)(66066001)(7696005)(71190400001)(71200400001)(6506007)(76176011)(33656002)(3846002)(2906002)(5660300002)(6306002)(54896002)(102836004)(66446008)(966005)(66946007)(53546011)(53936002)(25786009)(66556008)(9686003)(64756008)(236005)(66476007)(86362001)(11346002)(476003)(446003)(81156014)(8676002)(19627405001)(81166006)(14444005)(486006)(6246003)(6116002)(256004)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2993;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AdcgaSkKSlRW3VeT6jV5UFqmLhETo0tcEFayqsYWBGxuKbr3LNboPZLvAG5C32dm0YtPYazzXhjIvfsEckDx/U9zEpzIA3M0dWzRAlsbTGzvUoQl/6wfgOxIgIj8v7O8JqsNAddwwHG/pZ9HG5PxSL6IZUUF3lzIuFB/PRZ2qn8CNT3VzsgVIiv0L91JJ7813tXsXNz9Q6HghOgNUfzQ8v+VC7DoqoiWXhPpb+vot3Xqr1aRr62gqO+45Y2koD8VLfAVrQEM/GNjh7AX623m2WWep7fCAP7eUZErczgSB+qtH3ENuK6mr0LNSbSumLVWbFp+ESlxlM8GJOt7uMaXqM5pVITk+9YOrEqAMWjLiCkl9Z+/S1XGVPwXHnmQW7DgDv7fVzjVyCM4j9UF210DN9E1NoqyQZtpF2iuFRgNPks=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a210a2-1d57-4aa0-698d-08d716b60424
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 19:25:30.4449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdavid@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2993
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqO7qoXSiT1YwdearIGASzfkApqweSwT01xYVwegwnY=;
 b=D7Y7zYLxvbhVh/q0h4hiHgZ/P/UwRNEyDSZDiqE4DXm4B9ujuYNKqbY5eWFae3qG6v1NfXxbydRvNSQ1QBe/iNAhUGUJeeOdPrAiKeGTNXsxTHKj2ynyzUDidDYFI8A08ShnL3i+hvylXQqjBzJZ4YmBllVTz6j9Il/Vngnqcqs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David.Francis@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0975900379=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0975900379==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3217433D27E25905A31FC8EFEFDE0BN8PR12MB3217namp_"

--_000_BN8PR12MB3217433D27E25905A31FC8EFEFDE0BN8PR12MB3217namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:

Reviewed-by: David Francis <david.francis@amd.com>

________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: August 1, 2019 2:58:56 PM
To: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Li, Sun peng (Leo) <Sunpe=
ng.Li@amd.com>; Francis, David <David.Francis@amd.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Don't replace the dc_state for fa=
st updates

On Wed, Jul 31, 2019 at 12:26 PM Nicholas Kazlauskas
<nicholas.kazlauskas@amd.com> wrote:
>
> [Why]
> DRM private objects have no hw_done/flip_done fencing mechanism on their
> own and cannot be used to sequence commits accordingly.
>
> When issuing commits that don't touch the same set of hardware resources
> like page-flips on different CRTCs we can run into the issue below
> because of this:
>
> 1. Client requests non-blocking Commit #1, has a new dc_state #1,
> state is swapped, commit tail is deferred to work queue
>
> 2. Client requests non-blocking Commit #2, has a new dc_state #2,
> state is swapped, commit tail is deferred to work queue
>
> 3. Commit #2 work starts, commit tail finishes,
> atomic state is cleared, dc_state #1 is freed
>
> 4. Commit #1 work starts,
> commit tail encounters null pointer deref on dc_state #1
>
> In order to change the DC state as in the private object we need to
> ensure that we wait for all outstanding commits to finish and that
> any other pending commits must wait for the current one to finish as
> well.
>
> We do this for MEDIUM and FULL updates. But not for FAST updates, nor
> would we want to since it would cause stuttering from the delays.
>
> FAST updates that go through dm_determine_update_type_for_commit always
> create a new dc_state and lock the DRM private object if there are
> any changed planes.
>
> We need the old state to validate, but we don't actually need the new
> state here.
>
> [How]
> If the commit isn't a full update then the use after free can be
> resolved by simply discarding the new state entirely and retaining
> the existing one instead.
>
> With this change the sequence above can be reexamined. Commit #2 will
> still free Commit #1's reference, but before this happens we actually
> added an additional reference as part of Commit #2.
>
> If an update comes in during this that needs to change the dc_state
> it will need to wait on Commit #1 and Commit #2 to finish. Then it'll
> swap the state, finish the work in commit tail and drop the last
> reference on Commit #2's dc_state.
>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D204181
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: David Francis <david.francis@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4c90662e9fa2..fe5291b16193 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7288,6 +7288,29 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>                         ret =3D -EINVAL;
>                         goto fail;
>                 }
> +       } else {
> +               /*
> +                * The commit is a fast update. Fast updates shouldn't ch=
ange
> +                * the DC context, affect global validation, and can have=
 their
> +                * commit work done in parallel with other commits not to=
uching
> +                * the same resource. If we have a new DC context as part=
 of
> +                * the DM atomic state from validation we need to free it=
 and
> +                * retain the existing one instead.
> +                */
> +               struct dm_atomic_state *new_dm_state, *old_dm_state;
> +
> +               new_dm_state =3D dm_atomic_get_new_state(state);
> +               old_dm_state =3D dm_atomic_get_old_state(state);
> +
> +               if (new_dm_state && old_dm_state) {
> +                       if (new_dm_state->context)
> +                               dc_release_state(new_dm_state->context);
> +
> +                       new_dm_state->context =3D old_dm_state->context;
> +
> +                       if (old_dm_state->context)
> +                               dc_retain_state(old_dm_state->context);
> +               }
>         }
>
>         /* Must be success */
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB3217433D27E25905A31FC8EFEFDE0BN8PR12MB3217namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Series is:</p>
<span>Reviewed-by: David Francis &lt;david.francis@amd.com&gt;</span>
<p style=3D"margin-top:0;margin-bottom:0"></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> August 1, 2019 2:58:56 PM<br>
<b>To:</b> Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;<br>
<b>Cc:</b> amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Li, Sun peng=
 (Leo) &lt;Sunpeng.Li@amd.com&gt;; Francis, David &lt;David.Francis@amd.com=
&gt;<br>
<b>Subject:</b> Re: [PATCH 3/3] drm/amd/display: Don't replace the dc_state=
 for fast updates</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Jul 31, 2019 at 12:26 PM Nicholas Kazlausk=
as<br>
&lt;nicholas.kazlauskas@amd.com&gt; wrote:<br>
&gt;<br>
&gt; [Why]<br>
&gt; DRM private objects have no hw_done/flip_done fencing mechanism on the=
ir<br>
&gt; own and cannot be used to sequence commits accordingly.<br>
&gt;<br>
&gt; When issuing commits that don't touch the same set of hardware resourc=
es<br>
&gt; like page-flips on different CRTCs we can run into the issue below<br>
&gt; because of this:<br>
&gt;<br>
&gt; 1. Client requests non-blocking Commit #1, has a new dc_state #1,<br>
&gt; state is swapped, commit tail is deferred to work queue<br>
&gt;<br>
&gt; 2. Client requests non-blocking Commit #2, has a new dc_state #2,<br>
&gt; state is swapped, commit tail is deferred to work queue<br>
&gt;<br>
&gt; 3. Commit #2 work starts, commit tail finishes,<br>
&gt; atomic state is cleared, dc_state #1 is freed<br>
&gt;<br>
&gt; 4. Commit #1 work starts,<br>
&gt; commit tail encounters null pointer deref on dc_state #1<br>
&gt;<br>
&gt; In order to change the DC state as in the private object we need to<br=
>
&gt; ensure that we wait for all outstanding commits to finish and that<br>
&gt; any other pending commits must wait for the current one to finish as<b=
r>
&gt; well.<br>
&gt;<br>
&gt; We do this for MEDIUM and FULL updates. But not for FAST updates, nor<=
br>
&gt; would we want to since it would cause stuttering from the delays.<br>
&gt;<br>
&gt; FAST updates that go through dm_determine_update_type_for_commit alway=
s<br>
&gt; create a new dc_state and lock the DRM private object if there are<br>
&gt; any changed planes.<br>
&gt;<br>
&gt; We need the old state to validate, but we don't actually need the new<=
br>
&gt; state here.<br>
&gt;<br>
&gt; [How]<br>
&gt; If the commit isn't a full update then the use after free can be<br>
&gt; resolved by simply discarding the new state entirely and retaining<br>
&gt; the existing one instead.<br>
&gt;<br>
&gt; With this change the sequence above can be reexamined. Commit #2 will<=
br>
&gt; still free Commit #1's reference, but before this happens we actually<=
br>
&gt; added an additional reference as part of Commit #2.<br>
&gt;<br>
&gt; If an update comes in during this that needs to change the dc_state<br=
>
&gt; it will need to wait on Commit #1 and Commit #2 to finish. Then it'll<=
br>
&gt; swap the state, finish the work in commit tail and drop the last<br>
&gt; reference on Commit #2's dc_state.<br>
&gt;<br>
&gt; Bugzilla: <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D204=
181">https://bugzilla.kernel.org/show_bug.cgi?id=3D204181</a><br>
&gt; Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
&gt; Cc: David Francis &lt;david.francis@amd.com&gt;<br>
&gt; Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;=
<br>
<br>
Series is:<br>
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
<br>
&gt; ---<br>
&gt;&nbsp; .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 &#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&gt;&nbsp; 1 file changed, 23 insertions(&#43;)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; index 4c90662e9fa2..fe5291b16193 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br=
>
&gt; @@ -7288,6 &#43;7288,29 @@ static int amdgpu_dm_atomic_check(struct dr=
m_device *dev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
et =3D -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
oto fail;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * The commit is a fast update. Fast updates shoul=
dn't change<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * the DC context, affect global validation, and c=
an have their<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * commit work done in parallel with other commits=
 not touching<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * the same resource. If we have a new DC context =
as part of<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * the DM atomic state from validation we need to =
free it and<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * retain the existing one instead.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; struct dm_atomic_state *new_dm_state, *old_dm_state;<br=
>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; new_dm_state =3D dm_atomic_get_new_state(state);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; old_dm_state =3D dm_atomic_get_old_state(state);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (new_dm_state &amp;&amp; old_dm_state) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new=
_dm_state-&gt;context)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_release_state(new_dm_state-&gt;=
context);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_dm_=
state-&gt;context =3D old_dm_state-&gt;context;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old=
_dm_state-&gt;context)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_retain_state(old_dm_state-&gt;c=
ontext);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Must be success */<=
br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB3217433D27E25905A31FC8EFEFDE0BN8PR12MB3217namp_--

--===============0975900379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0975900379==--
