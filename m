Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD5E67BEA
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jul 2019 22:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCCB89B06;
	Sat, 13 Jul 2019 20:25:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE3389B06
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jul 2019 20:25:03 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i10so27613761iol.13
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jul 2019 13:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=KhYcTNmepHW+SJF7bV/hyWGl8+HfkSL8qD9u9LWYdwg=;
 b=BYaeIXazFevfPB/5zh+l+nmK7KupHxKpY39Z1IR1ldaFEdTcNdN5cWK3YvMfNSJQW1
 H0xYrVBWrgnxkcwwwFxprAk8UHZH4W3Qc82AEbd1qAZTfJe3NvQslPJF15sgHrU6JiXA
 vqfVI+b2lHstCDW+1QxYNIREgb7q3Qe+Hc43ZCq6GnAZnT1kQhEtSrVOjl7IgtMJ56hZ
 5rUlsBFaH1ZZhmlI5QYbNlCgQYmpS6Yxhl+gFTvbkaoApxi8jcXD5CSeCxACx1f1x9JY
 fpf3b/i3eicFiuaSLnua5EEEM91CzdTqYv4iQAn3iaTTslq2fs4vKX1jfrCr8g6yByTU
 euVw==
X-Gm-Message-State: APjAAAUi4/9Ujvc6AfTjYgzOM3HnRTntwTvNGHSUWLiVGS8ehDKG7WuK
 9ObLjtPeLO8fOB5cMULFOJh700AV
X-Google-Smtp-Source: APXvYqxxNoDNI/1rGySQ0ow6dc63rTXApeSby7pWy1K/O4hREIvh3dK4VaTHVZ8YsoNuLWM01pSMqw==
X-Received: by 2002:a5e:8c16:: with SMTP id n22mr17857172ioj.105.1563049502337; 
 Sat, 13 Jul 2019 13:25:02 -0700 (PDT)
Received: from [192.168.2.100] ([142.127.174.106])
 by smtp.gmail.com with ESMTPSA id n26sm9024206ioc.74.2019.07.13.13.25.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jul 2019 13:25:01 -0700 (PDT)
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
 <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
 <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
 <9f882acd-c48f-3bbd-2d90-659c2edead39@amd.com>
 <f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com>
From: Felix Kuehling <felix.kuehling@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=felix.kuehling@gmail.com; keydata=
 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
 ThvDE+lT3+QrUw1UzruOVC1MP+Nkk30=
Message-ID: <44747586-8c98-6c85-dc5c-7464f59b205e@gmail.com>
Date: Sat, 13 Jul 2019 16:24:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=KhYcTNmepHW+SJF7bV/hyWGl8+HfkSL8qD9u9LWYdwg=;
 b=ZzlJGrqcAfggmaTijVyyaqdSeBLxId6SGjZPtINsbkzVlFq5H0uS91nGfWdY+7C/0g
 l7ymbBOxSidKlwo086TuwNE101SsPxX/ZsUqQL3H6+1eNadK47GZ9M5GttcCRcOWhiAN
 N0uvgcN7qp9sN9X7TMr4flX0gdtXjMwWyTDlvlXCQp6AmTuc5WWwQVZdyYP7313axcr4
 LrzVE2VgQGRfecpMpGmYGbMnW/4osfrLXeFIGuaeDrfs0jquoVWNrUaaLXydSK8gxxg9
 Gi/pbgd1I44XPjTskHI0OkKTS9Uw8nV6Yw5kw8vMlKChIP1ZlshohPhUZWjnVUDOyXcu
 B0uA==
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: multipart/mixed; boundary="===============0945771492=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0945771492==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OZ9Yrfzx3FfSeD2Y0kYYt4HEB2RKs6mRl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OZ9Yrfzx3FfSeD2Y0kYYt4HEB2RKs6mRl
Content-Type: multipart/mixed; boundary="WXqmnOtHoAaoNmIhUbxG39IEM5rwr92cm";
 protected-headers="v1"
From: Felix Kuehling <felix.kuehling@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Message-ID: <44747586-8c98-6c85-dc5c-7464f59b205e@gmail.com>
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
 <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
 <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
 <9f882acd-c48f-3bbd-2d90-659c2edead39@amd.com>
 <f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com>
In-Reply-To: <f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com>

--WXqmnOtHoAaoNmIhUbxG39IEM5rwr92cm
Content-Type: multipart/alternative;
 boundary="------------59A3B4AD88DB4C7638B1B15B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------59A3B4AD88DB4C7638B1B15B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 2019-04-30 um 1:03 p.m. schrieb Koenig, Christian:
>>> The only real solution I can see is to be able to reliable kill shade=
rs
>>> in an OOM situation.
>> Well, we can in fact preempt our compute shaders with low latency.
>> Killing a KFD process will do exactly that.
> I've taken a look at that thing as well and to be honest it is not even=
=20
> remotely sufficient.
>
> We need something which stops the hardware *immediately* from accessing=
=20
> system memory, and not wait for the SQ to kill all waves, flush caches =

> etc...
>
> One possibility I'm playing around with for a while is to replace the=20
> root PD for the VMIDs in question on the fly. E.g. we just let it point=
=20
> to some dummy which redirects everything into nirvana.
>
> But implementing this is easier said than done...

Warming up this thread, since I just fixed another bug that was enabled
by artificial memory pressure due to the GTT limit.

I think disabling the PD for the VMIDs is a good idea. A problem is that
HWS firmware updates PD pointers in the background for its VMIDs. So
this would require a reliable and fast way to kill the HWS first.

An alternative I thought about is, disabling bus access at the BIF level
if that's possible somehow. Basically we would instantaneously kill all
GPU system memory access, signal all fences or just remove all fences
from all BO reservations (reservation_object_add_excl_fence(resv, NULL))
to allow memory to be freed, let the OOM killer do its thing, and when
the dust settles, reset the GPU.

Regards,
=C2=A0 Felix

>
> Regards,
> Christian.

--------------59A3B4AD88DB4C7638B1B15B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">Am 2019-04-30 um 1:03 p.m. schrieb
      Koenig, Christian:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com">
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <blockquote type=3D"cite" style=3D"color: #000000;">
          <pre class=3D"moz-quote-pre" wrap=3D"">The only real solution I=
 can see is to be able to reliable kill shaders
in an OOM situation.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Well, we can in fact preem=
pt our compute shaders with low latency.
Killing a KFD process will do exactly that.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I've taken a look at that th=
ing as well and to be honest it is not even=20
remotely sufficient.

We need something which stops the hardware <b class=3D"moz-txt-star"><spa=
n class=3D"moz-txt-tag">*</span>immediately<span class=3D"moz-txt-tag">*<=
/span></b> from accessing=20
system memory, and not wait for the SQ to kill all waves, flush caches=20
etc...

One possibility I'm playing around with for a while is to replace the=20
root PD for the VMIDs in question on the fly. E.g. we just let it point=20
to some dummy which redirects everything into nirvana.

But implementing this is easier said than done...</pre>
    </blockquote>
    <p>Warming up this thread, since I just fixed another bug that was
      enabled by artificial memory pressure due to the GTT limit.</p>
    <p>I think disabling the PD for the VMIDs is a good idea. A problem
      is that HWS firmware updates PD pointers in the background for its
      VMIDs. So this would require a reliable and fast way to kill the
      HWS first.</p>
    <p>An alternative I thought about is, disabling bus access at the
      BIF level if that's possible somehow. Basically we would
      instantaneously kill all GPU system memory access, signal all
      fences or just remove all fences from all BO reservations
      (reservation_object_add_excl_fence(resv, NULL)) to allow memory to
      be freed, let the OOM killer do its thing, and when the dust
      settles, reset the GPU.<br>
    </p>
    <p>Regards,<br>
      =C2=A0 Felix<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:f5c698ad-2aff-b3c5-2041-05a10983438a@amd.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Regards,
Christian.
</pre>
    </blockquote>
  </body>
</html>

--------------59A3B4AD88DB4C7638B1B15B--

--WXqmnOtHoAaoNmIhUbxG39IEM5rwr92cm--

--OZ9Yrfzx3FfSeD2Y0kYYt4HEB2RKs6mRl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQSF9iw3xYpcigJ58/LWGSsMBQyTdgUCXSo+HAAKCRDWGSsMBQyT
dtkeAP96AVm1joiyGB4yLHGKFoXaiu5qJ9k2Vx2N1govvh78JwD/QZ3qFT7aCXMS
bJ8y1z89fKLJj+imoEpoMAeciayEReA=
=MlDq
-----END PGP SIGNATURE-----

--OZ9Yrfzx3FfSeD2Y0kYYt4HEB2RKs6mRl--

--===============0945771492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0945771492==--
