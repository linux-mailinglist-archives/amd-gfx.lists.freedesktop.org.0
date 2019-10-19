Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC273DDFFD
	for <lists+amd-gfx@lfdr.de>; Sun, 20 Oct 2019 20:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7A89A61;
	Sun, 20 Oct 2019 18:21:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABFA89996
 for <amd-gfx@lists.freedesktop.org>; Sat, 19 Oct 2019 13:27:59 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([13.231.109.76]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MaJ3n-1iZxNf1gmr-00WCeE for
 <amd-gfx@lists.freedesktop.org>; Sat, 19 Oct 2019 15:27:55 +0200
To: amd-gfx@lists.freedesktop.org
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: thunderbolt 3 eGPU related bugs under Linux (1. Unable to hot-unplug, 
 2. initialization not properly)
Autocrypt: addr=quwenruo.btrfs@gmx.com; prefer-encrypt=mutual; keydata=
 mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAG0IlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT6JAU4EEwEIADgCGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCXZw1oQAKCRDC
 PZHzoSX+qCY6CACd+mWu3okGwRKXju6bou+7VkqCaHTdyXwWFTsr+/0ly5nUdDtT3yEVggPJ
 3VP70wjlrxUjNjFb6iIvGYxiPOrop1NGwGYvQktgRhaIhALG6rPoSSAhGNjwGVRw0km0PlIN
 D29BTj/lYEk+jVM1YL0QLgAE1AI3krihg/lp/fQT53wLhR8YZIF8ETXbClQG1vJ0cllPuEEv
 efKxRyiTSjB+PsozSvYWhXsPeJ+KKjFen7ebE5reQTPFzSHctCdPnoR/4jSPlnTlnEvLeqcD
 ZTuKfQe1gWrPeevQzgCtgBF/WjIOeJs41klnYzC3DymuQlmFubss0jShLOW8eSOOWhLRuQEN
 BFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcgaCbPEwhLj
 1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj/IrRUUka
 68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fNGSsRb+pK
 EKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0q1eW4Jrv
 0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEvABEBAAGJ
 ATwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCXZw1rgUJCWpOfwAKCRDCPZHz
 oSX+qFcEB/95cs8cM1OQdE/GgOfCGxwgckMeWyzOR7bkAWW0lDVp2hpgJuxBW/gyfmtBnUai
 fnggx3EE3ev8HTysZU9q0h+TJwwJKGv6sUc8qcTGFDtavnnl+r6xDUY7A6GvXEsSoCEEynby
 72byGeSovfq/4AWGNPBG1L61Exl+gbqfvbECP3ziXnob009+z9I4qXodHSYINfAkZkA523JG
 ap12LndJeLk3gfWNZfXEWyGnuciRGbqESkhIRav8ootsCIops/SqXm0/k+Kcl4gGUO/iD/T5
 oagaDh0QtOd8RWSMwLxwn8uIhpH84Q4X1LadJ5NCgGa6xPP5qqRuiC+9gZqbq4Nj
Message-ID: <fc475d0b-a988-d549-c446-cecf64059b5a@gmx.com>
Date: Sat, 19 Oct 2019 21:27:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:sekJaL3ES1YfDb21Ngwkl0WiXnLa/Yz6UbAc3L2p1DqDLRFUv1c
 eSNL1wNQ26ZTCD044MAn2ISE/qxHM4C2/aQivhWZkaXoN7O9LQshbrNOEW3C9Pi1F+FWwTQ
 f4YsgNYZ5tjlkqZdIHzefLJN7EKS7AxaD84y48wKOWTsqjd29SzCbMOCaA0dn4axZNBIeA6
 Zb7hBj19IbW9qG6O6N0Xg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:beHLf1sY+tk=:DBerXibUh40fw3ybKiZwWd
 HgXEUu5lm6Tu5EdJiblh1mcyFC6r1wU5WMrv/Bv3odMgiJXtBBQX2KcLIqn+IBoLfJwa8HdmY
 zmp+XNcwCHCOKaCIBaVJ5aqFDe3bK3aj/wVVjzldzmMW8xFWwl+Tmc++dD7782BkBchalmu7G
 VQUNcENv4Gtyb6AsbDqUmave5DMYo51mbH4ujUcVOlpxRVpNW8OR76i5t708Ju0w9uwFHGUkq
 b7MSeNHnjn6DQ2zS4Z5Ecc8a6QfCtXycJWKROHe2oEwrTECFrbJ+ohK0u3fRvNS/4B8VGCew2
 NmqA9CxBrylSO4cFxEEAVHnJ4YLnWjpxq1IXHYWG/K4So9oEOXdwiEZonVk5ijAqTXcKKFXxa
 39Q24i8I6LcnO6G30IzxKwuEWbwkq62tSjwCX8hdFLgS0WrRdbk5wqI/akCDEJgkFausVneKZ
 twhxkDapexN7bi7eL0Q8QQjeVefXJoUh4JTkplW3bNk8WRuUiRYVIP+rsfVqlUto1ZXx9Ci/g
 unVQjPyOakTneCsmV+DbHJGcj4LzG1m1gb2SOVLR2u02FEcGjk+y/PYHyGimbC6I6//8pRAz3
 7U7ajo+YHQjejNo9wQlv5hEY/eNfjZQHZo7ey/lhE0zUFaImcoIatsgpthDffpzyPl5j/xREi
 iJtn+fd6JzMlbjHQdeJ6tS2nM8GRRM00aF10NpSB6m7N6onmYh70ZgUleqoms0G0x83YJ5qfb
 nfidgGpqIejSrlMiJ5tw8x93gE0HmrkrUMZuyreUr9cdtOvYSY7JO//fWtf/v9VWGR70B2sln
 V0EcdqB6dgkgAxPdGaiR2Oj8l01oM3DYe6QmYY1XV6HTQmAliumkKwXj2CAN6H0FTKImgCEdC
 cL2OQFVp63T14/zSsrDPtJdlbwiH2XW9ZM+LaaalU0AQ5jf3A77pgGTyUUIgh/aCfubVp3znV
 15lNooOpZm44BAwdkhRX1uIYMBDwdQMz8gFZIxECz8yGYnJbYQI3gMHT9JyE/uocjsMMKniJy
 GmTU+Q8qjmWoAv2DpC/oUX8NxSSafuPArlJdirJQBl7BxcOz/gKOP22yCme1nHMuLUF8wEGN4
 fq57Q64k8mXRpBigh6fuFwlaPOHWYUNYwVd787tANqUkI3888wGuB2rJt0//qXsrDfK7e8SHK
 iFEZ04AQfZTJgvPG3l/23owAgC/2yxNbw9sucZoD1JyHocfQqBErSw9LLjGFfi0eJi4pRgwzs
 xN+7fs0+O9AHEb4u2J1K7DkVrO62TqEFuH0eWXxMYx3/m2gxL84AvgNQSZ9c=
X-Mailman-Approved-At: Sun, 20 Oct 2019 18:21:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1571491675;
 bh=RqS3NZaehrSVzB3bT88OZo/lJHthQ0q72A8ee7Jya28=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=Q/S3TEM+BFjfOpcZPSnVakc4nVZFmANr7TSfAZiAdoUqB4LTfhaFy2CtwCmir83de
 DqjUa55+MBuOlvQNYFYudTUOlAIQXWDqXkwOBKK7rQPZCDnvq07iPRpC3+SpXi2q7L
 CbwayJkyE28JYIIuI2qN5MsKXcOXnvm9+Ex8y5Vc=
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
Content-Type: multipart/mixed; boundary="===============1760236491=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1760236491==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KaBrD5u6ywVI7I5PZ1V76BZNrjiV39N40"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KaBrD5u6ywVI7I5PZ1V76BZNrjiV39N40
Content-Type: multipart/mixed; boundary="O30hFYTtsAzEXApjTrMeARy9sLkn5iKtL"

--O30hFYTtsAzEXApjTrMeARy9sLkn5iKtL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for all your awesome works for the full open-source graphic stack.=


But I still find some bugs related to thunderbolt 3 eGPU, which is very
annoying.

- Unable to hot unplug.
  Hot unplug can easily crash the kernel, most like due to some
  BUG_ON().
  This is particularly annoying if the thunderbolt 3 cable is not
  stable.

  I guess it can't be easily fixed anyway, since most PCIE device
  doesn't expect link/physical layer error.

- Initialization is not properly done under Linux only.
  If the GPU is initialized under Linux (no matter hot-plugged in or
  cold boot), although eGPU is properly initialized and detected, the
  display connected to eGPU will just output message indicating
  unacceptable refresh rate.

  The display only accepts refresh rate not higher than 60Hz, and xrandr
  shows the display is at 60Hz, but still, the display doesn't accept
  that signal.
  Also, X11 starts and log shows no obvious problem, but no display.

  The most strange thing is, if the eGPU is initialized under windows
  first, then rebooted into Linux with eGPU, then everything works fine.

  I guess this can be solved.

Hardware info:
- Laptop: ThinkPad X1 Carbon 6th gen
- eGPU box: AORUS gaming box
- eGPU GPU: AORUS RX580 mini

Thanks,
Qu


--O30hFYTtsAzEXApjTrMeARy9sLkn5iKtL--

--KaBrD5u6ywVI7I5PZ1V76BZNrjiV39N40
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl2rD1UACgkQwj2R86El
/qipYAgApE3SjPkwGIZBHQV/pB40gVNv1ogRVNQJrdbObaxsjwBNsTRAiriuGw/K
QtKE1G5nARP5V5h+fRsLRGU8JuzlQT7gOdbgDYtPTjK5nnRbdqEZRqXutG5BjlIz
YcRChbz/Ir3ZFZbUyWMpvI8Ldn3EaTqLn/AYyvD2tetC4UEGkaYWz18YA+59/eDv
nAFR2bBJQGhUivIrVw+72q9mrFffnrRZpRlflJqQqZEnu2P8CbYA5FBmpsNdyS+u
M0MJqny1HilzCgoTlOO+fiXAAGPJn7ru7vmKzLtrgPriTn7iP6UXXExriLWdYkrl
i+gRwKQQw716prGmctngTvXxLSkWOA==
=pvSX
-----END PGP SIGNATURE-----

--KaBrD5u6ywVI7I5PZ1V76BZNrjiV39N40--

--===============1760236491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1760236491==--
