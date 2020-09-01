Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 360CE258FAE
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Sep 2020 15:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8076E271;
	Tue,  1 Sep 2020 13:58:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3F06E26F;
 Tue,  1 Sep 2020 13:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcL1IgwK3RuOowxVqKDA7poddtUetG1CRZPw8VPCUhkpSjG1EJRbgNrXjh4BEKej6tWLDJkFgQSHoqeudAujxOR2jKJK3WXSp5QKXDYUGnzp25ZBgP/+RwNvCm2xk8ELWcGgu6BWKEway3MKzKcHKpU9MDJK7rB2NymhkEPel9+b/O6VzSm90sCesHOtZrV/MJEtWYXX+2DIGMqBpzrrtxmlGRuJTqOvmShd5IDhxQi3qm9DXloNvz9g1ZQkHLf/y1eByuzGyL2Eh+Pxn08Tt+6k0vx5FQntLzcE09RYp9TJhohJGv1BhdfOXJRQCmbpc+1OmhKX7XxfHV4KJqCEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR+L58zvhJqWtysqvSJSgUwRT2WVU4qTT1rMr0WIO2I=;
 b=itMSkXliqotkEFJtTYMkY5hZ8Uy0OiuGarHOVe7qCJvGvRFK2GaRj3jb42VC9BQJtKKrzk9AzNQ4la9RDAT7vswFqoKolMymV6up3LGDBDUufAFOxOhZkFEKYWQsDVzbrC0QvDAsc1kOXg7ee570mOEyGGCNtLMMMhZbPkcLCtw41qgMNffURdn1z9/42T3UYmmAD+Pd1tCatE3YTzjhG3CaCFVwWan84ymF5EBgfQKh4xinxRYyNRENbIKKeX4DCTFKhhFHRj/ICHmPvPFdk88EuzyDV8hJTleOXPkw7KO3ffAgvMqTOG1+NtoRloa5UGMS8jpISUe/BZuxiTiElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR+L58zvhJqWtysqvSJSgUwRT2WVU4qTT1rMr0WIO2I=;
 b=NR8+fVUM2IaXHz7NDxc3KujJrjrPV7rq2xwgeNtaYqJp2xkc4FwRxZWCIGBOywCQVUp539eUCiAKIS9p66k9ytTdkfCvu2VCZRGnIGnkuQ4t3L5EasURJ+bmjrJJP3RNGOp9aTTZYawvgjpAbOOn8pHu508tZEs8IQzv1jfTVeY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW2PR12MB2345.namprd12.prod.outlook.com (2603:10b6:907:2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Tue, 1 Sep
 2020 13:58:47 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe%2]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 13:58:46 +0000
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
 <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
 <15b4eb58-a51b-b2fd-f51d-1576d50914cc@amd.com>
 <20200826112423.6a8637a2@eldfell>
 <20200901075432.GW2352366@phenom.ffwll.local>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <9d8c481f-1b95-cdc3-0d94-2b8292ac6031@amd.com>
Date: Tue, 1 Sep 2020 09:58:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200901075432.GW2352366@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Tue, 1 Sep 2020 13:58:45 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85428e8b-48dc-459e-b3e8-08d84e7f24b9
X-MS-TrafficTypeDiagnostic: MW2PR12MB2345:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB23457C518E567D224B8DD4018C2E0@MW2PR12MB2345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkCHqJcXoYcA96GhPuj8vVDW2DUjUq6ru2Fj5W8mGzgfo9amKp48nUbVZwB93t5zRSFEfWg+XkfbQcS2mu05Yrsjj2ss73QHMEkicVENE0QuVpJVtszDTztGeMWyJmaDub/lUx4xPFEPJpJnKypS/y3qs1gTXoQR1duXg1rZLAKFO5ZgLBYWnOL1xfhsVqJDWqzprjhTHUkcKe9L29Ooz3FA7/gXTd+aNe5SkRjPq5+tCDEdXpkAicJPRJoKc6Yae5yRRF1TVkF6U3JUwcK1feDUbRodIb2w7eNYrCD3Itr7qkaosKYtKO/oX8x6GmQK2o9ydSHO1O2DpTuglvOs7MufJLMJsTkR5kVIt8JuhTn1RPP4UpZKfx73Tvmrcp2/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(5660300002)(2906002)(52116002)(478600001)(66574015)(53546011)(36756003)(31696002)(83380400001)(26005)(186003)(2616005)(31686004)(956004)(66946007)(66556008)(66476007)(16576012)(110136005)(6486002)(54906003)(316002)(8676002)(4326008)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PIKGt1qSiuoODi30zCc+M8Q7ZL1AgkYd1crhzOBpc0SArahKMduc5egSQk9+0tUSBbV6XXrAbRdaH2vpOtUMhgUI6qkm2eT+ASIqX8S4RDCVYb+uj4orATNFQ+4lEiEbhteBqyAFqtCCeUzKiiBpvc01yM7N1aZqhXdnzm4a5niOfi7Cfz1vMwgjZxBFVp3vuPK1paMf9uxO2IEn92hzmiSzPBXyXfQoqID4mRqGTORLOtEtjvmokktiOJgJiEbw9v8wt6iLUTerLhfJn9s+yfkOHoBlVzSbwQsOogg5f3adKUO6ikWV8wQuqP72okHI//bkREfhLjS0kBmb8Ob2zn8feKuG7WwmF9D5JzniiBRcKD14wREke5OaIIUshJsFRGHGj2GbIgP3JJqXJ2/Wd0ZQzywvIdQ8m8TUlvf7DCWUvgnxotS4XVIncISXYfuB6paXsUCfNfBU53WfOKa9b0eGpUKmABLWnL0Soei5uLNYBG8TE0veR4amwP7zfNxYdLO5waL4VdgfCraOg6LhpPd/6BxEp1/Up2cX6oxoc60LCBypmtunwThzoypaS3BBnpo7OHan149aMaoVdP3GWTrJIzdWa82bCAZHDvNOpfRwkQcijuGmv6AuDBa5kF0i2GGT/erXAIhlnAYmH1skVg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85428e8b-48dc-459e-b3e8-08d84e7f24b9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 13:58:46.7571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz+Tm+zh0/Hunahg+gXS6v8OWzkasdihH7UzdND/3aBU65rrMqpcE8Jm4dWuBVsp/3L5aB26hlgh85j3Zw7qgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2345
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
Cc: Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAyMDIwLTA5LTAxIDM6NTQgYS5tLiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQs
IEF1ZyAyNiwgMjAyMCBhdCAxMToyNDoyM0FNICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToK
Pj4gT24gVHVlLCAyNSBBdWcgMjAyMCAxMjo1ODoxOSAtMDQwMAo+PiAiS2F6bGF1c2thcywgTmlj
aG9sYXMiIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+IHdyb3RlOgo+Pgo+Pj4gT24gMjAy
MC0wOC0yMiA1OjU5IGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+Pj4+IE9uIDIwMjAtMDgt
MjEgODowNyBwLm0uLCBLYXpsYXVza2FzLCBOaWNob2xhcyB3cm90ZTogIAo+Pj4+PiBPbiAyMDIw
LTA4LTIxIDEyOjU3IHAubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOiAgCj4+Pj4+PiBGcm9tOiBN
aWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPj4+Pj4+Cj4+Pj4+PiBEb24ndCBj
aGVjayBkcm1fY3J0Y19zdGF0ZTo6YWN0aXZlIGZvciB0aGlzIGVpdGhlciwgcGVyIGl0cwo+Pj4+
Pj4gZG9jdW1lbnRhdGlvbiBpbiBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oOgo+Pj4+Pj4KPj4+Pj4+
ICDCoCAqIEhlbmNlIGRyaXZlcnMgbXVzdCBub3QgY29uc3VsdCBAYWN0aXZlIGluIHRoZWlyIHZh
cmlvdXMKPj4+Pj4+ICDCoCAqICZkcm1fbW9kZV9jb25maWdfZnVuY3MuYXRvbWljX2NoZWNrIGNh
bGxiYWNrIHRvIHJlamVjdCBhbiBhdG9taWMKPj4+Pj4+ICDCoCAqIGNvbW1pdC4KPj4+Pj4+Cj4+
Pj4+PiBUaGUgYXRvbWljIGhlbHBlcnMgZGlzYWJsZSB0aGUgQ1JUQyBhcyBuZWVkZWQgZm9yIGRp
c2FibGluZyB0aGUgcHJpbWFyeQo+Pj4+Pj4gcGxhbmUuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBwcmV2
ZW50cyBhdCBsZWFzdCB0aGUgZm9sbG93aW5nIHByb2JsZW1zIGlmIHRoZSBwcmltYXJ5IHBsYW5l
IGdldHMKPj4+Pj4+IGRpc2FibGVkIChlLmcuIGR1ZSB0byBkZXN0cm95aW5nIHRoZSBGQiBhc3Np
Z25lZCB0byB0aGUgcHJpbWFyeSBwbGFuZSwKPj4+Pj4+IGFzIGhhcHBlbnMgZS5nLiB3aXRoIG11
dHRlciBpbiBXYXlsYW5kIG1vZGUpOgo+Pj4+Pj4KPj4+Pj4+ICogVG9nZ2xpbmcgQ1JUQyBhY3Rp
dmUgdG8gMSBmYWlsZWQgaWYgdGhlIGN1cnNvciBwbGFuZSB3YXMgZW5hYmxlZAo+Pj4+Pj4gIMKg
wqAgKGUuZy4gdmlhIGxlZ2FjeSBEUE1TIHByb3BlcnR5ICYgY3Vyc29yIGlvY3RsKS4KPj4+Pj4+
ICogRW5hYmxpbmcgdGhlIGN1cnNvciBwbGFuZSBmYWlsZWQsIGUuZy4gdmlhIHRoZSBsZWdhY3kg
Y3Vyc29yIGlvY3RsLiAgCj4+Pj4+Cj4+Pj4+IFdlIHByZXZpb3VzbHkgaGFkIHRoZSByZXF1aXJl
bWVudCB0aGF0IHRoZSBwcmltYXJ5IHBsYW5lIG11c3QgYmUgZW5hYmxlZAo+Pj4+PiBidXQgc29t
ZSB1c2Vyc3BhY2UgZXhwZWN0cyB0aGF0IHRoZXkgY2FuIGVuYWJsZSBqdXN0IHRoZSBvdmVybGF5
IHBsYW5lCj4+Pj4+IHdpdGhvdXQgYW55dGhpbmcgZWxzZS4KPj4+Pj4KPj4+Pj4gSSB0aGluayB0
aGUgY2hyb211aXVtb3MgYXRvbWljdGVzdCB2YWxpZGF0ZXMgdGhhdCB0aGlzIHdvcmtzIGFzIHdl
bGw6Cj4+Pj4+Cj4+Pj4+IFNvIGlzIERSTSBnb2luZyBmb3J3YXJkIHRoZW4gd2l0aCB0aGUgZXhw
ZWN0YXRpb24gdGhhdCB0aGlzIGlzIHdyb25nCj4+Pj4+IGJlaGF2aW9yIGZyb20gdXNlcnNwYWNl
Pwo+Pj4+Pgo+Pj4+PiBXZSByZXF1aXJlIGF0IGxlYXN0IG9uZSBwbGFuZSB0byBiZSBlbmFibGVk
IHRvIGRpc3BsYXkgYSBjdXJzb3IsIGJ1dCBpdAo+Pj4+PiBkb2Vzbid0IG5lY2Vzc2FyaWx5IG5l
ZWQgdG8gYmUgdGhlIHByaW1hcnkuICAKPj4+Pgo+Pj4+IEl0J3MgYSAicGljayB5b3VyIHBvaXNv
biIgc2l0dWF0aW9uOgo+Pj4+Cj4+Pj4gMSkgQ3VycmVudGx5IHRoZSBjaGVja3MgYXJlIGludmFs
aWQgKGF0b21pY19jaGVjayBtdXN0IG5vdCBkZWNpZGUgYmFzZWQKPj4+PiBvbiBkcm1fY3J0Y19z
dGF0ZTo6YWN0aXZlKSwgYW5kIGl0J3MgZWFzeSBmb3IgbGVnYWN5IEtNUyB1c2Vyc3BhY2UgdG8K
Pj4+PiBhY2NpZGVudGFsbHkgaGl0IGVycm9ycyB0cnlpbmcgdG8gZW5hYmxlL21vdmUgdGhlIGN1
cnNvciBvciBzd2l0Y2ggRFBNUwo+Pj4+IG9mZiDihpIgb24uCj4+Pj4KPj4+PiAyKSBBY2N1cmF0
ZWx5IHJlamVjdGluZyBvbmx5IGF0b21pYyBzdGF0ZXMgd2hlcmUgdGhlIGN1cnNvciBwbGFuZSBp
cwo+Pj4+IGVuYWJsZWQgYnV0IGFsbCBvdGhlciBwbGFuZXMgYXJlIG9mZiB3b3VsZCBicmVhayB0
aGUgS01TIGhlbHBlciBjb2RlLAo+Pj4+IHdoaWNoIGNhbiBvbmx5IGRlYWwgd2l0aCB0aGUgIkNS
VEMgb24gJiBwcmltYXJ5IHBsYW5lIG9mZiBpcyBub3QKPj4+PiBhbGxvd2VkIiBjYXNlIHNwZWNp
ZmljYWxseS4KPj4+Pgo+Pj4+IDMpIFRoaXMgcGF0Y2ggYWRkcmVzc2VzIDEpICYgMikgYnV0IG1h
eSBicmVhayBleGlzdGluZyBhdG9taWMgdXNlcnNwYWNlCj4+Pj4gd2hpY2ggd2FudHMgdG8gZW5h
YmxlIGFuIG92ZXJsYXkgcGxhbmUgd2hpbGUgZGlzYWJsaW5nIHRoZSBwcmltYXJ5IHBsYW5lLgo+
Pj4+Cj4+Pj4KPj4+PiBJIGRvIHRoaW5rIGluIHByaW5jaXBsZSBhdG9taWMgdXNlcnNwYWNlIGlz
IGV4cGVjdGVkIHRvIGhhbmRsZSBjYXNlIDMpCj4+Pj4gYW5kIGxlYXZlIHRoZSBwcmltYXJ5IHBs
YW5lIGVuYWJsZWQuIEhvd2V2ZXIsIHRoaXMgaXMgbm90IGlkZWFsIGZyb20gYW4KPj4+PiBlbmVy
Z3kgY29uc3VtcHRpb24gUG9WLiBUaGVyZWZvcmUsIGhlcmUncyBhbm90aGVyIGlkZWEgZm9yIGEg
cG9zc2libGUKPj4+PiB3YXkgb3V0IG9mIHRoaXMgcXVhZ21pcmU6Cj4+Pj4KPj4+PiBhbWRncHVf
ZG0gZG9lcyBub3QgcmVqZWN0IGFueSBhdG9taWMgc3RhdGVzIGJhc2VkIG9uIHdoaWNoIHBsYW5l
cyBhcmUKPj4+PiBlbmFibGVkIGluIGl0LiBJZiB0aGUgY3Vyc29yIHBsYW5lIGlzIGVuYWJsZWQg
YnV0IGFsbCBvdGhlciBwbGFuZXMgYXJlCj4+Pj4gb2ZmLCBhbWRncHVfZG0gaW50ZXJuYWxseSBl
aXRoZXI6Cj4+Pj4KPj4+PiBhKSBFbmFibGVzIGFuIG92ZXJsYXkgcGxhbmUgYW5kIG1ha2VzIGl0
IGludmlzaWJsZSwgZS5nLiBieSBhc3NpZ25pbmcgYQo+Pj4+IG1pbmltdW0gc2l6ZSBGQiB3aXRo
IGFscGhhID0gMC4KPj4+Pgo+Pj4+IGIpIEVuYWJsZXMgdGhlIHByaW1hcnkgcGxhbmUgYW5kIGFz
c2lnbnMgYSBtaW5pbXVtIHNpemUgRkIgKHNjYWxlZCB1cCB0bwo+Pj4+IHRoZSByZXF1aXJlZCBz
aXplKSBjb250YWluaW5nIGFsbCBibGFjaywgcG9zc2libHkgdXNpbmcgY29tcHJlc3Npb24uCj4+
Pj4gKFRyeWluZyB0byBtaW5pbWl6ZSB0aGUgbWVtb3J5IGJhbmR3aWR0aCkKPj4+Pgo+Pj4+Cj4+
Pj4gRG9lcyBlaXRoZXIgb2YgdGhlc2Ugc2VlbSBmZWFzaWJsZT8gSWYgYm90aCBkbywgd2hpY2gg
b25lIHdvdWxkIGJlCj4+Pj4gcHJlZmVyYWJsZT8KPj4+Pgo+Pj4+ICAgCj4+Pgo+Pj4gSXQncyBy
ZWFsbHkgdGhlIHNhbWUgc29sdXRpb24gc2luY2UgRENOIGRvZXNuJ3QgbWFrZSBhIGRpc3RpbmN0
aW9uIAo+Pj4gYmV0d2VlbiBwcmltYXJ5IG9yIG92ZXJsYXkgcGxhbmVzIGluIGhhcmR3YXJlLiBE
Q0UgZG9lc24ndCBoYXZlIG92ZXJsYXkgCj4+PiBwbGFuZXMgZW5hYmxlZCBzbyB0aGlzIGlzIG5v
dCByZWxldmFudCB0aGVyZS4KPj4+Cj4+PiBUaGUgb2xkIGJlaGF2aW9yIChwcmUgNS4xPykgd2Fz
IHRvIHNpbGVudGx5IGFjY2VwdCB0aGUgY29tbWl0IGV2ZW4gCj4+PiB0aG91Z2ggdGhlIHNjcmVl
biB3b3VsZCBiZSBjb21wbGV0ZWx5IGJsYWNrIGluc3RlYWQgb2Ygb3V0cmlnaHQgCj4+PiByZWpl
Y3RpbmcgdGhlIGNvbW1pdC4KPj4+Cj4+PiBJIGFsbW9zdCB3b25kZXIgaWYgdGhhdCBtYWtlcyBt
b3JlIHNlbnNlIGluIHRoZSBzaG9ydCB0ZXJtIGhlcmUgc2luY2UgCj4+PiB0aGUgb25seSAidXNl
cnNwYWNlIiBhZmZlY3RlZCBoZXJlIGlzIElHVC4gV2UnbGwgZmFpbCB0aGUgQ1JDIGNoZWNrcywg
Cj4+PiBidXQgbm8gdXNlcnNwYWNlIGFjdHVhbGx5IHRyaWVzIHRvIGFjdGl2ZWx5IHVzZSBhIGN1
cnNvciB3aXRoIG5vIHByaW1hcnkgCj4+PiBwbGFuZSBlbmFibGVkIGZyb20gbXkgdW5kZXJzdGFu
ZGluZy4KPj4KPj4gSGksCj4+Cj4+IEkgYmVsaWV2ZSB0aGF0IHRoZXJlIGV4aXN0cyB1c2Vyc3Bh
Y2UgdGhhdCB3aWxsICphY2NpZGVudGFsbHkqIGF0dGVtcHQKPj4gdG8gdXBkYXRlIHRoZSBjdXJz
b3IgcGxhbmUgd2hpbGUgcHJpbWFyeSBwbGFuZSBvciB3aG9sZSBDUlRDIGlzIG9mZi4KPj4gU29t
ZSB2ZXJzaW9ucyBvZiBNdXR0ZXIgbWlnaHQgZG8gdGhhdCBvbiByYWN5IGNvbmRpdGlvbnMsIEkg
c3VzcGVjdC4KPj4gVGhlc2UgYXJlIGxlZ2FjeSBLTVMgdXNlcnMsIG5vdCBhdG9taWMgS01TLgo+
Pgo+PiBIb3dldmVyLCBJIGRvIG5vdCBiZWxpZXZlIHRoZXJlIGV4aXN0cyBhbnkgdXNlcnNwYWNl
IHRoYXQgd291bGQKPj4gYWN0dWFsbHkgZXhwZWN0IHRoZSBkaXNwbGF5IHRvIHNob3cgdGhlIGN1
cnNvciBwbGFuZSBhbG9uZSB3aXRob3V0IGEKPj4gcHJpbWFyeSBwbGFuZS4gVGhlcmVmb3JlIEkn
ZCBiZSBvayB3aXRoIGxlZ2FjeSBjdXJzb3IgaW9jdGxzIHNpbGVudGx5Cj4+IHN1Y2NlZWRpbmcu
IEF0b21pYyBjb21taXRzIG5vdC4gU28gdGhlIGRpZmZlcmVuY2UgaGFzIHRvIGJlIGluIHRoZQo+
PiB0cmFuc2xhdGlvbiBmcm9tIGxlZ2FjeSBVQVBJIHRvIGtlcm5lbCBpbnRlcm5hbCBhdG9taWMg
aW50ZXJmYWNlLgo+Pgo+Pj4gSW4gdGhlIGxvbmcgdGVybSBJIHRoaW5rIHdlIGNhbiB3b3JrIG9u
IGdldHRpbmcgY3Vyc29yIGFjdHVhbGx5IG9uIHRoZSAKPj4+IHNjcmVlbiBpbiB0aGlzIGNhc2Us
IHRob3VnaCBJIGNhbid0IHNheSBJIHJlYWxseSBsaWtlIGhhdmluZyB0byByZXNlcnZlIAo+Pj4g
c29tZSBzbWFsbCBidWZmZXIgKGVnLiAxNngxNikgZm9yIGFsbG93aW5nIGxpZ2h0dXAgb24gdGhp
cyBjb3JuZXIgY2FzZS4KPj4KPj4gV2h5IHdvdWxkIHlvdSBib3RoZXIgaW1wbGVtZW50aW5nIHRo
YXQ/Cj4+Cj4+IElzIHRoZXJlIHJlYWxseSBhbiBJR1QgdGVzdCB0aGF0IHVuY29uZGl0aW9uYWxs
eSBkZW1hbmRzIGN1cnNvciBwbGFuZQo+PiB0byBiZSB1c2FibGUgd2l0aG91dCBhbnkgb3RoZXIg
cGxhbmVzPwo+IAo+IFRoZSBjdXJzb3IgcGxhbmUgaXNuJ3QgYW55dGhpbmcgZWxzZSB0aGFuIGFu
eSBvdGhlciBwbGFuZSwgYXNpZGUgZnJvbSB0aGUKPiBsZWdhY3kgdWFwaSBpbXBsaWNhdGlvbiB0
aGF0IGl0J3MgdXNlZCBmb3IgdGhlIGxlZ2FjeSBjdXJzb3IgaW9jdGxzLgo+IAo+IFdoaWNoIG1l
YW5zIHRoZSBjdXJzb3IgcGxhbmUgY291bGQgYWN0dWFsbHkgYmUgYSBmdWxsLWZlYXR1cmVkIHBs
YW5lLCBhbmQKPiBpdCdzIHRvdGFsbHkgbGVnaXQgdG8gdXNlIGp1c3QgdGhhdCB3aXRob3V0IGFu
eXRoaW5nIGVsc2UgZW5hYmxlZC4KPiAKPiBTbyB5ZWFoIGlmIHlvdSBhbGxvdyB0aGF0LCBpdCBi
ZXR0ZXIgc2hvdyBzb21ldGhpbmcgOi0pCj4gCj4gUGVyc29uYWxseSBJJ2QgbGVhbiB0b3dhcmRz
IG1lcmdpbmcgdGhpcyBwYXRjaCB0byBjbG9zZSB0aGUgZ2FwIChvbGRlc3QKPiByZWdyZXNzaW9u
cyB3aW5zIGFuZCBhbGwgdGhhdCkgYW5kIHRoZW4gaW1wbGVtZW50IHRoZSBibGFjayBwbGFuZSBo
YWNrIG9uCj4gdG9wLgoKTm90IHN1cmUgSSdtIGEgYmlnIGZhbiBvZiB0aGUgYmxhY2sgcGxhbmUg
aGFjay4gSXMgdGhlcmUgYW55IHdheSB3ZQpjb3VsZCBhbGxvdyB0aGUgKG5vbi1kaXNwbGF5ZWQp
IGN1cnNvciBmb3IgdGhlIGxlZ2FjeSBJT0NUTCBidXQgbm90IGZvcgp0aGUgYXRvbWljIElPQ1RM
PyBJIGFzc3VtZSB0aGF0IHdvdWxkIHJlcXVpcmUgYSBjaGFuZ2UgdG8gY29yZSBjb2RlIGluCnRo
ZSBhdG9taWMgaGVscGVycyB0aGF0IGNvbnZlcnQgbGVnYWN5IElPQ1RMcyB0byBhdG9taWMgZm9y
IGRyaXZlcnMuCgpIYXJyeQoKPiAtRGFuaWVsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeAo=
