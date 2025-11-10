Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01969C471B3
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Nov 2025 15:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702510E3CA;
	Mon, 10 Nov 2025 14:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EObahkZ0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5814B10E3CA
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Nov 2025 14:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEpQw6r322u0bgrsBd4R8diZi+5ps3QRgwRqIqMuGYrXdNdcE78Hpy5y7nW0fCZqUopjLS6jyop5DCRJS2+khZ2H0Mv26ERUOembBWgNHqOEM6Mb05DLzcOPy1KIM+S2Nc3xr/zCUSlyrozNz01xH3jErsZjtAgWbx0TrbO2EAGj0YiiRddnMwsnb8GYEQihtw4KuB2rlf2CUnLc/J+Ubhi98fQAAqDlv6x6i4KXtG2atL8dlI5vMMkCUS2EAtdVjR6Q4wRP4z20a9MfxUTjXKA5ck0COI9qydIK7QlhTdBKpl9bsODwsBc86qEUXW0CQCffrUh832FldzAwKAWCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc3o+KJIF7JlL1PMPmibhzD0kSY/jKZThISZY39hzDE=;
 b=Vu1r55svCgN9oKVXU2FOgHhX8hJK22o51DxujkJT2m9mojXqUjM2bON19Ek0M8AEccBXARP1ak6ROPqWSf1qnaLBZnvb8lLsyKaF47QJ7o1v+HbgvYlsmJMDTESKuXin+lwu1d475FNb2HL42d+f2Tffd9ilgTwB0t/AYxEXe4zmBqUTG3skJxOJB04QB6+tCv86umG42bQ5KZr90Rz9OY5YZwqMyHvMfAthmgxtiw2/qkEeJ8yu27su9NrUM6A7tn9xA8wA4GWEWiWTTJpe7QnmYDc/E8BmAD5cvncmmv/e7D9JkNUrD4Bzk5fdezAarMwSOVHhrWb6FkmfkjKthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc3o+KJIF7JlL1PMPmibhzD0kSY/jKZThISZY39hzDE=;
 b=EObahkZ0UOnO/x7dOSe6oBr/I4mV6TIGUOh+4En/wPca6RmoGeW2IP+PKAI7UO00SEcRKUb+wo5gi0i9k83g0vCPvFDcNyxMYdzHOJ16/krA2CyS9Gnnu+Y2NRAJ8NGEoMpYtLLPp+0BMoIBpjaSo3NQh+b77CWDICdzqEEcLDs=
Received: from DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) by
 DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 14:10:45 +0000
Received: from DS0PR12MB6534.namprd12.prod.outlook.com
 ([fe80::ea87:74ba:36ec:8cf6]) by DS0PR12MB6534.namprd12.prod.outlook.com
 ([fe80::ea87:74ba:36ec:8cf6%7]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 14:10:41 +0000
From: "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, "Li,
 Roman" <Roman.Li@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>, "Chung,
 ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, 
 "Wu, Ray" <Ray.Wu@amd.com>, "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>, "Hung,
 Alex" <Alex.Hung@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>
Subject: RE: [PATCH 00/13] DC Patches November 03, 2025
Thread-Topic: [PATCH 00/13] DC Patches November 03, 2025
Thread-Index: AQHcTmqTFNEY2+XcuEyf0TdDQl9k47Tr+lzg
Date: Mon, 10 Nov 2025 14:10:41 +0000
Message-ID: <DS0PR12MB6534303971053CFC6B79EA619CCEA@DS0PR12MB6534.namprd12.prod.outlook.com>
References: <20251105154035.883188-1-Jerry.Zuo@amd.com>
In-Reply-To: <20251105154035.883188-1-Jerry.Zuo@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-10T14:10:38.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6534:EE_|DS0PR12MB9037:EE_
x-ms-office365-filtering-correlation-id: 58b30394-1407-448c-ad31-08de2062eec5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?4mcZNLyKRlQmUquNMxTeYMoIWmjyyNyFsUWB9uzb7vmEO5Mcs4FdogoSdS?=
 =?iso-8859-1?Q?EAWUSxNhOhJIXl113Dsmb1KYCUdn4grwt//dNBRVut4u1ZGQ5jC1Q9IIXx?=
 =?iso-8859-1?Q?U+8R0sWvD8l7jLKlUFUxx+8JtEERfDNaKPyu0ZJn15ljrAAdtbCR0lV7lJ?=
 =?iso-8859-1?Q?f+kW6tspq/mQlPVnZxZeffAwfoo/xeB4+Qiog+SLHYoJhh4qxPw9BVTspq?=
 =?iso-8859-1?Q?jz5qr3Hfmwr0i/A5U33p1VrWDL5OF0AY9z7DHSfE0eYscFTfCGuTUhJoQp?=
 =?iso-8859-1?Q?6v6EscJvHFz8HFh047NyFxqI8CdLpNaL1PIeWHc+ZkgFhoiQCwsOlfZBkM?=
 =?iso-8859-1?Q?0HGDqzL9zxJzZE22OCJdWChZKwFVOJ7THTq1x+XkGjw1vEQuIDBwZz0U77?=
 =?iso-8859-1?Q?K/zNJ6Oydf3nytGSSqA3WNDHUN2d/4fNlJsyqmpriSmdp99QkDYdnibXHw?=
 =?iso-8859-1?Q?D6ZAc0/7RIadg7M2HlhL7uD2acfuLVxf5aGEkfS9NotrMZsRXcExyZXV62?=
 =?iso-8859-1?Q?oimiqUXKOM+krxewuh8lAcpbNzDadKjU0phQmuzWv6mjm1WpYWpKWno8FP?=
 =?iso-8859-1?Q?+jGE65cG9ei9IDMx0Nji8zYutm9Oeh9kOy+gtHWpk/VZTjvILhZiqpz0G7?=
 =?iso-8859-1?Q?sBUgY+3QehVZrifdSQGkPZzRuAAm3Df+MRS3pPswOEaQgHHLyvlTGhNupb?=
 =?iso-8859-1?Q?Fl0nNuV1X2t8qMN615Le3nxo+HtV1Lkkmwk00jR5Xq86sN4kBwsJpvigA1?=
 =?iso-8859-1?Q?iVh7dyP18gSWLEq/8KyI3mQhj++6n5DGa/2FB8sKyaMrkTojkhmIpqP/D8?=
 =?iso-8859-1?Q?TvCCfqwQGvYYvmFrQiIE7g44KNYZAmLlIXayUlCClGfx6wX28UvDJIdktM?=
 =?iso-8859-1?Q?iS9sjlz0nVNfjwb88IOHaSNi/zj9CSCHbKlXfESHfABtAtARtdFIATxBXw?=
 =?iso-8859-1?Q?j8lysmqslW+gCidPjqerscsh99TOYfmdIpglQkQ3f9kOo52bBHO4zYQBn7?=
 =?iso-8859-1?Q?vFw0/tWFD+WXcHjc+eZSN9+CW8yfxG/Aa6RRq4KR3mTcLt0oprprwNgPkF?=
 =?iso-8859-1?Q?KnHH29RO9FgWEi8rZrO3C3MvCu74DdLqT2kkKWqhWtdm+n84gcWUxs1+IU?=
 =?iso-8859-1?Q?y9EtOVHIe6SomZQKasgfHGWgvTZKjTSLOcBTo0d5UP5+z+GS6rFegMN3+Y?=
 =?iso-8859-1?Q?nLT+h4bFwbqvAlm+ZA/71NkfauwJ+I9tH44WVhXjaWTkz/nhXQiqgpu7Sk?=
 =?iso-8859-1?Q?NlbyeT1OdwJ2Idb80q94Lf35HKPatFvFKhUWJvRk8QrRFbTOapHZUDBf6T?=
 =?iso-8859-1?Q?gB4nHWbawKNLuoYJY5524Q7+MoY+d1uHbbb/7q0qLoU1tkDiG7RuZ7YyKj?=
 =?iso-8859-1?Q?uw77yqDqbP58H6qVcOc5jdwnPwCBGzHnJUqjG3g3Qyypy8dZLNEtReiOlh?=
 =?iso-8859-1?Q?dRC/xcJK1pVKl6TMjwUxw5wsPq+1XUnUvd+zc5bs30ZveX0m4IR6ovX/nL?=
 =?iso-8859-1?Q?VaQmC6PrAEB0tFn8BLtKKiokosraJ77gchh5KzOqqk8RUJdmlbf8gTusTN?=
 =?iso-8859-1?Q?pfsMoZFWmQPIkx9tqtNP993z3j+B?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6534.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jJ69ep5iGiaceA0+2JBDKInEfBXsaTHLPgqtiD4xILCAVXXFRjO6rMiWGZ?=
 =?iso-8859-1?Q?6nzL8COhjwrYKrN/YoYWzjLhWc1CEyWOEq95MHZEHAB5BxCMAk0c1ZqD0K?=
 =?iso-8859-1?Q?J6RlRO3dE+ybJ08JeTaJnpBDDqfSdHxkuO/j8bi2BV2Z/ZCzpM6jeC44/2?=
 =?iso-8859-1?Q?/d1y6OmD8FjgN9LyD8/CD9phYcJwoAXZGqK+TrnOEazV580vRLsobJnp07?=
 =?iso-8859-1?Q?DejiadUC/Jxbh9jvzNIlX102Dielbhnuf33PvgUErm3XXEuBXN7Q9XLHe+?=
 =?iso-8859-1?Q?o5z0PHvDcJwddeljCCvHwhOjnorllQcmDM6GL8BK8JQ8Qco1ecTZTaGkcG?=
 =?iso-8859-1?Q?ANdY/kPDPW1NeERBy41mhAH6TB83Dk6cdwvTs7dJ5b/DHf6WiD8HiI0g4p?=
 =?iso-8859-1?Q?f0pcmkRbpLxthfzI/ae0F2crW4J3dClyOw8cBCyALvqGD6CE9TFran4yJx?=
 =?iso-8859-1?Q?XYtiNQOHjrJwbqzcfCxhf+wh7qg0GeFc4KyE5IdzJcJJY+4e9IeQqN5ged?=
 =?iso-8859-1?Q?/ZvEGuYSz6RHkTwC+vMWTKUlgEEtZR1y2APm0NwpUMsY6LYOvw1mVKrGci?=
 =?iso-8859-1?Q?mzjnAO4JZL2lNSjNZimVV3YfFqWI4sESDvYSvtV3unsno1hnHHxY3CFYYO?=
 =?iso-8859-1?Q?C4Baks/vBN+TXGneoVt1t1j9h2d6ESJY0cZpX88clL5W7TBM8vUFHlocnm?=
 =?iso-8859-1?Q?WSFms981Kn8rOkw3vVzrloZTyAQjkB9KtrZdT5elUxOmS/LzaRFP5rgqeu?=
 =?iso-8859-1?Q?6fTJrBQGJxK5ZIZV3D5QAntn4fknwSeGvbGg7tq1nOEQeRLlZKoN8UUSqi?=
 =?iso-8859-1?Q?G01KyoGnq8vJLAHgMUntuGWl+egy+DsMAN8zUjpjNTidGZ7IZJF7vrlsK5?=
 =?iso-8859-1?Q?Q5L2E8DKpUEqO0dGFkiuyDYWMk3UCFGdNf48evXpfznz69u+ETGXGAG1ww?=
 =?iso-8859-1?Q?g0uZagLQOliIIyQ0f3cI0p+L0Hi80KjPywux1wl0buiMKtSNOqF1LMcwhq?=
 =?iso-8859-1?Q?89xl6rnaA41w/yV7m0G1I+j0wOWZggvXRYHxFlThNzspjbs5lHdcQngoil?=
 =?iso-8859-1?Q?RB8YoulIUHmY5KGk/cXsxxydV+uT00ze2Aks+6ZIPB770X6yFHzBq2DuId?=
 =?iso-8859-1?Q?Zc8fbh1dl9ahyThIc2QU7tkBGSfYMgRrZo6hiV+J/+jzSy1YJ2kQghcp1W?=
 =?iso-8859-1?Q?xYuPG0ev2cJAQPIhYNuIdOy4ugh/B2yzrv07j8vdzzyg4j9eF84nO9nBK+?=
 =?iso-8859-1?Q?Y7u+o68hgQhptZ3EgoCABw6dbVkdUseXnRD6QlJ4zS3F5YfoM88yIcmTWN?=
 =?iso-8859-1?Q?qCXcpJCUt++xLrtZH6LI7ZNCN0KaAryLyta0YxuQjib3Ynp9wHb0yH7+Lj?=
 =?iso-8859-1?Q?QL3ZsikYKNOfnkCldJ/NB95De8EdZis8pP1Oh5/VNo3Akj3qWG2DhwAkv5?=
 =?iso-8859-1?Q?NrMYzIssBjWSQjEnrQ5gGoUTn1OrnkFkG+qbTW4NMw38GeCfm/8gg0cZs/?=
 =?iso-8859-1?Q?zMa91y8AYhVHS5HIYej7Qi8GS9dS31gxITh0Kx1x2ZJHFXy+a5riYGC/8m?=
 =?iso-8859-1?Q?nyhwXYe9sghebbLUL43Q1rPzjSSi+84YUtntAJ+AHotJ1aRFdsDKn9JQ5R?=
 =?iso-8859-1?Q?gmfnZX2BBZysk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6534.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b30394-1407-448c-ad31-08de2062eec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 14:10:41.7928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqi4VzUYkFMZEIu9sQIGGRs4Mb4AKYJFmWAfvHjPfSbDyowVinA6DlXNslp5Np8QmQEp37PH/YKgup3ISTGa5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037
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

[Public]

Hi all,

This week this patchset was tested on 4 systems, two dGPU and two APU based=
, and tested across multiple display and connection types.

APU
        * Single Display eDP -> 1080p 60hz, 1920x1200 165hz, 3840x2400 60hz
        * Single Display DP (SST DSC) -> 4k144hz, 4k240hz
        * Multi display -> eDP + DP/HDMI/USB-C -> 1080p 60hz eDP + 4k 144hz=
, 4k 240hz (Includes USB-C to DP/HDMI adapters)
        * Thunderbolt -> LG Ultrafine 5k
        * MST DSC -> Cable Matters 101075 (DP to 3x DP) with 3x 4k60hz disp=
lays, HP Hook G2 with 2x 4k60hz displays
        * USB 4 -> HP Hook G4, Lenovo Thunderbolt Dock, both with 2x 4k60hz=
 DP and 1x 4k60hz HDMI displays
        * SST PCON -> Club3D CAC-1085 + 1x 4k 144hz, FRL3, at a max resolut=
ion supported by the dongle of 4k 120hz YUV420 12bpc.
        * MST PCON -> 1x 4k 144hz, FRL3, at a max resolution supported by t=
he adapter of 4k 120hz RGB 8bpc.

DGPU
        * Single Display DP (SST DSC) -> 4k144hz, 4k240hz
        * Multiple Display DP -> 4k240hz + 4k144hz
        * MST (Startech MST14DP123DP [DP to 3x DP] and 2x 4k 60hz displays)
        * MST DSC (with Cable Matters 101075 [DP to 3x DP] with 3x 4k60hz d=
isplays)

The testing is a mix of automated and manual tests. Manual testing includes=
 (but is not limited to)
        * Changing display configurations and settings
        * Video/Audio playback
        * Benchmark testing
        * Suspend/Resume testing
        * Feature testing (Freesync, HDCP, etc.)

Automated testing includes (but is not limited to)
        * Script testing (scripts to automate some of the manual checks)
        * IGT testing

The testing is mainly tested on the following displays, but occasionally th=
ere are tests with other displays
        * Samsung G8 Neo 4k240hz
        * Samsung QN55QN95B 4k 120hz
        * Acer XV322QKKV 4k144hz
        * HP U27 4k Wireless 4k60hz
        * LG 27UD58B 4k60hz
        * LG 32UN650WA 4k60hz
        * LG Ultrafine 5k 5k60hz
        * AU Optronics B140HAN01.1 1080p 60hz eDP
        * AU Optronics B160UAN01.J 1920x1200 165hz eDP
        * Samsung ATNA60YV02-0 3840x2400 60Hz OLED eDP


The patchset consists of the amd-staging-drm-next branch (Head commit - e3b=
a532665bc6c3f72cb59f5af9c845069169f7c -> drm/amdgpu: fix possible fence lea=
ks from job structure) with new patches added on top of it.

Tested on Ubuntu 24.04.3, on Wayland and X11, using Gnome.

Tested-by: Dan Wheeler <daniel.wheeler@amd.com>

Thank you,

Dan Wheeler
Sr. Technologist | AMD
SW Display
---------------------------------------------------------------------------=
---------------------------------------
1 Commerce Valley Dr E, Thornhill, ON L3T 7X6
amd.com


-----Original Message-----
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
Sent: Wednesday, November 5, 2025 10:36 AM
To: amd-gfx@lists.freedesktop.org
Cc: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.L=
i@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Li, Roman <Roman.=
Li@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>; Chung, ChiaHsuan (Tom) <ChiaHs=
uan.Chung@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>; Wheeler, Daniel <Daniel=
.Wheeler@amd.com>; Wu, Ray <Ray.Wu@amd.com>; LIPSKI, IVAN <IVAN.LIPSKI@amd.=
com>; Hung, Alex <Alex.Hung@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
Subject: [PATCH 00/13] DC Patches November 03, 2025

Summary:

* Enable VRR when unsynced with the stream
* Refactor DSC cap calculation for dcn35
* Add debug log for power feature
* Fix fill latency issue
* Do not initialize LSDMA if it is not supported by dmu

Alvin Lee (1):
  drm/amd/display: Only initialize LSDMA if it is supported in DMU

Chuntao Tso (1):
  drm/amd/display: To support Replay frame skip mode

Dillon Varone (1):
  drm/amd/display: Fix index bug for fill latency

Dominik Kaszewski (2):
  drm/amd/display: Change lock descriptor values
  drm/amd/display: Revert in_transfer_func_change to MED

Fangzhi Zuo (1):
  drm/amd/display: Refactor HDCP Status Log Format

George Shen (1):
  drm/amd/display: Add interface to capture power feature status for
    debug logging

Ian Chen (1):
  drm/amd/display: Add new SMART POWER OLED interfaces

Ivan Lipski (1):
  drm/amd/display: Allow VRR params change if unsynced with the stream

Leo Chen (1):
  drm/amd/display: dynamically clock gate before and after prefetch

Mohit Bawa (1):
  drm/amd/display: refactor DSC cap calculation for dcn35

Taimur Hassan (2):
  drm/amd/display: [FW Promotion] Release 0.1.35.0
  drm/amd/display: Promote DC to 3.2.358

 .../amd/display/amdgpu_dm/amdgpu_dm_replay.c  |   2 +-
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  |  30 +++
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 242 ++++++++++++------
 drivers/gpu/drm/amd/display/dc/dc.h           |  28 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   6 +
 .../gpu/drm/amd/display/dc/dce/dmub_replay.c  |   7 +-
 .../gpu/drm/amd/display/dc/dce/dmub_replay.h  |   5 +-
 .../src/dml2_core/dml2_core_dcn4_calcs.c      |   2 +-
 .../drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c  |  31 ++-
 .../display/dc/hubbub/dcn31/dcn31_hubbub.c    |   7 +-
 .../display/dc/hubbub/dcn35/dcn35_hubbub.c    |  52 +++-
 .../display/dc/hubbub/dcn35/dcn35_hubbub.h    |   1 +
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |   2 +
 .../gpu/drm/amd/display/dc/inc/link_service.h |   4 +-
 .../link/protocols/link_edp_panel_control.c   |  17 +-
 .../link/protocols/link_edp_panel_control.h   |   4 +-
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  10 +-
 .../amd/display/modules/freesync/freesync.c   |  11 +
 .../drm/amd/display/modules/hdcp/hdcp_log.c   | 124 +--------
 .../drm/amd/display/modules/inc/mod_hdcp.h    | 126 ++++-----
 .../amd/display/modules/power/power_helpers.c |  30 +++
 .../amd/display/modules/power/power_helpers.h |   5 +
 23 files changed, 464 insertions(+), 285 deletions(-)

--
2.43.0

