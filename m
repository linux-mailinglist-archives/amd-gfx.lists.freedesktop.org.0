Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AFC413432
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Sep 2021 15:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5066D6E987;
	Tue, 21 Sep 2021 13:32:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5C26E987;
 Tue, 21 Sep 2021 13:32:14 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g41so48878647lfv.1;
 Tue, 21 Sep 2021 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=oqnbGLGKVV3vioMJI5T3NGeXZ4ZEdkavS4gHWqgTBPc=;
 b=L3drl/j9BUuimMdUH1ojyQGsZD1UXfGj1SwEP4QIeZ4X6uvacjYkVBQGsPRWwLTPgP
 HRDqEXTM4FRCKaTTFypz0VuvwOXSeAePDkjrVR7OVo8umoJG3rUFJt468LPrimBTRzf/
 W+IDOgqhPBiFiJ0ZIiMetY7zwdj/ioiVEsyFu37YauO0NcXrXT8C0So02dqPkwwRbLd1
 SWiYR+PFQ8qb93nw1uyyPLANZFGONnwzc2XDLFcDgopzZYMZJlUzTOPZ7BdpoUZXM0xw
 LaKmUPbiCdlAeD7XELArbif0B4VHVguTOjNROiQy5aPVnXlhAgc4b6C122EbFpkf7kF7
 03sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=oqnbGLGKVV3vioMJI5T3NGeXZ4ZEdkavS4gHWqgTBPc=;
 b=J4rjROeYzP4FStDWzaxarlqg/4YT2s4qoVDxDsTq19HNdzq+dd7pCXK/4kH2mSHzVY
 /kL1dr0e0Jv3u/FqFAbnKYWfD1S791HIaKZx9YJjp4rQO+aI2S3bf3JiKyxXOm4dJ+BI
 pcSGkouxjpJy9B1hMsvn2d40Esw6qkq0h20sv3fq5xt62Mg4MwBuwhDkjrxWEuolJVn2
 vdQiXrdsxlQeO3QC1rN732SMQ/uJ+VMBd2nbZ0jPYYOrp7Q82am0dOBrw6ALci1cNIYQ
 bgU9lgCotrigxiWIbsrPgJXdW7EXzhv3tDsvAn+2MuGSg5IUN4hgwZK0aXStuX3KpGGB
 fGjw==
X-Gm-Message-State: AOAM531EGQZp2JSiNhsomtxqFMuo4HMXUAfP8ppUaF/JVwXeQQFWlO2B
 ODl4i75THLpsEk3X/AByy9U=
X-Google-Smtp-Source: ABdhPJw9fk6zCh1tQt2sXvGtpzpkZYH+FfK+NGAavT97aSAajmwjgl2Tibq+XuKzlyhADMtDnmQ5wA==
X-Received: by 2002:a2e:309:: with SMTP id 9mr8709930ljd.102.1632231130798;
 Tue, 21 Sep 2021 06:32:10 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t1sm1532892lfl.89.2021.09.21.06.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 06:32:10 -0700 (PDT)
Date: Tue, 21 Sep 2021 16:31:58 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210921163158.688c26bc@eldfell>
In-Reply-To: <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GtI727Fa4QfOXu+30AAzbtY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/GtI727Fa4QfOXu+30AAzbtY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Sep 2021 20:14:50 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-09-15 10:01, Pekka Paalanen wrote:> On Fri, 30 Jul 2021 16:41:29 =
-0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> Use the new DRM RFC doc section to capture the RFC previously only
> >> described in the cover letter at
> >> https://patchwork.freedesktop.org/series/89506/
> >>
> >> v3:
> >>  * Add sections on single-plane and multi-plane HDR
> >>  * Describe approach to define HW details vs approach to define SW int=
entions
> >>  * Link Jeremy Cline's excellent HDR summaries
> >>  * Outline intention behind overly verbose doc
> >>  * Describe FP16 use-case
> >>  * Clean up links
> >>
> >> v2: create this doc
> >>
> >> v1: n/a
> >>
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com> =20

Hi Harry!

...

> >> ---
> >>  Documentation/gpu/rfc/color_intentions.drawio |   1 +
> >>  Documentation/gpu/rfc/color_intentions.svg    |   3 +
> >>  Documentation/gpu/rfc/colorpipe               |   1 +
> >>  Documentation/gpu/rfc/colorpipe.svg           |   3 +
> >>  Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 ++++++++++++++++++
> >>  Documentation/gpu/rfc/index.rst               |   1 +
> >>  6 files changed, 589 insertions(+)
> >>  create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
> >>  create mode 100644 Documentation/gpu/rfc/color_intentions.svg
> >>  create mode 100644 Documentation/gpu/rfc/colorpipe
> >>  create mode 100644 Documentation/gpu/rfc/colorpipe.svg
> >>  create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst =20

...

> >> +
> >> +Here are some examples of real-life objects and their approximate
> >> +luminance values:
> >> +
> >> +
> >> +.. _PQ (perceptual quantizer) function: https://en.wikipedia.org/wiki=
/High-dynamic-range_video#Perceptual_Quantizer
> >> +
> >> +.. flat-table::
> >> +   :header-rows: 1
> >> +
> >> +   * - Object
> >> +     - Luminance in nits
> >> +
> >> +   *  - Fluorescent light
> >> +      - 10,000
> >> +
> >> +   *  - Highlights
> >> +      - 1,000 - sunlight =20
> >=20
> > Did fluorescent and highlights get swapped here?
> >  =20
> No, though at first glance it can look like that. This is pulled
> from an internal doc I didn't write, but I think the intention is
> to show that fluorescent lights can be up to 10,000 nits and
> highlights are usually 1,000+ nits.
>=20
> I'll clarify this in v4.
>=20
> A quick google search seems to show that there are even fluorescent
> lights with 46,000 nits. I guess these numbers provide a ballpark
> view more than anything.

Those seem quite extreme fluorescent lights, far beyond what one might
find in offices I suppose?

I mean, I can totally stare straight at my office fluorescent lights
without any discomfort.

Highlights OTOH of course depend on which highlights we're talking
about, and your 1000 - sunlight range I can totally agree with.

If you look at a sea or a lake on a sunny day, the reflections of Sun
on the water surface are much much brighter than anything else in
nature aside from Sun itself. I happened to see this myself when
playing with a camera: the rest of the image can be black while the
water highlights still shoot way beyond the captured dynamic range.

> >> +
> >> +   *  - White Objects
> >> +      - 250 - 1,000
> >> +
> >> +   *  - Typical Objects
> >> +      - 1 - 250
> >> +
> >> +   *  - Shadows
> >> +      - 0.01 - 1
> >> +
> >> +   *  - Ultra Blacks
> >> +      - 0 - 0.0005
> >> +
> >> +
> >> +Transfer functions
> >> +------------------
> >> +
> >> +Traditionally we used the terms gamma and de-gamma to describe the
> >> +encoding of a pixel's luminance value and the operation to transfer f=
rom
> >> +a linear luminance space to the non-linear space used to encode the
> >> +pixels. Since some newer encodings don't use a gamma curve I suggest
> >> +we refer to non-linear encodings using the terms `EOTF, and OETF`_, or
> >> +simply as transfer function in general. =20
> >=20
> > Yeah, gamma could mean lots of things. If you have e.g. OETF gamma
> > 1/2.2 and EOTF gamma 2.4, the result is OOTF gamma 1.09.
> >=20
> > OETF, EOTF and OOTF are not unambiguous either, since there is always
> > the question of whose function is it.
> >  =20
> Yeah, I think both gamma and EO/OE/OO/EETF are all somewhat problematic.

We can use them, but we have to explain which functions we are
referring to. In particular, if you have a specific EOTF, then the
inverse of it should be called EOTF^-1 and not OETF, to follow what I
have understood of specs like BT.2100.

Personally I'd take things further and talk about encoding and decoding
functions when the intent is to translate between pixel values and
light-linear color values rather than characterising a piece of
equipment.

> I tend to think about these more in terms of input and output transfer
> functions but then you have the ambiguity about what your input and
> output mean. I see the input TF between framebuffer and blender,
> and the output TF between blender and display.

Indeed, those are good explanations.

> You also have the challenge that input and output transfer functions
> fulfill multiple roles, e.g. an output transfer as defined above might do
> linear-to-PQ conversion but could also fill the role of tone mapping
> in the case where the input content spans a larger range than the
> display space.

I would like to avoid such conflation or use different terms. That is
indeed the confusion often had I think.

I would say that encoding/decoding function does not do any kind of
tone-mapping. It's purely for numerical encoding to save bits on
transmission or taps in a LUT. Although, for taps in a LUT
optimization, it is called "shaper" instead. A shaper function (or 1D
LUT) does not need to equal an encoding function.

We're going to need glossary.

> > Two different EOTFs are of interest in composition for display:
> > - the display EOTF (since display signal is electrical)
> > - the content EOTF (since content is stored in electrical encoding)
> >=20
> >  =20
> >> +
> >> +The EOTF (Electro-Optical Transfer Function) describes how to transfer
> >> +from an electrical signal to an optical signal. This was traditionally
> >> +done by the de-gamma function.
> >> +
> >> +The OETF (Opto Electronic Transfer Function) describes how to transfer
> >> +from an optical signal to an electronic signal. This was traditionally
> >> +done by the gamma function.
> >> +
> >> +More generally we can name the transfer function describing the trans=
form
> >> +between scanout and blending space as the **input transfer function**=
, and =20
> >=20
> > "scanout space" makes me think of cable/signal values, not framebuffer
> > values. Or, I'm not sure. I'd recommend replacing the term "scanout
> > space" with something less ambiguous like framebuffer values.
> >  =20
> Framebuffer space/values is much better than scanout space.

I'd go with values. Does "space" include encoding or not? Depends on
context. Thinking about:

- light-linear RGB values in BT.709 color space
- sRGB encoded RGB values in BT.709 color space
- sRGB encoded YCbCr values in BT.709 color space

Are these difference spaces, or the same space but with different
encodings and color models?

I have been gravitating towards "color space" being the same in all of
the above: BT.709 color space. OTOH, saying "color space, encoding and
model" gets awkward really fast, so sometimes it's just "color space".

Framebuffer or pixel values could be, say, 10-bit integer, while
(non-linear) color values would be that converted to the [0.0, 1.0]
range for example.

> >> +the transfer function describing the transform from blending space to=
 the
> >> +output space as **output transfer function**. =20
> >=20
> > You're talking about "spaces" here, but what you are actually talking
> > about are value encodings, not (color) spaces. An EOTF or OETF is not
> > meant to modify the color space.
> >=20
> > When talking about blending, what you're actually interested in is
> > linear vs. non-linear color value encoding. This matches your talk
> > about EOTF and OETF, although you need to be careful to specify which
> > EOTF and OETF you mean. For blending, color values need to be linear in
> > light intensity, and the inverse of the E-to-O mapping before blending
> > is exactly the same as the O-to-E mapping after blending. Otherwise you
> > would alter even opaque pixels.
> >  =20
> I struggle a bit with finding the right term to talk about color value
> encoding in general. Concrete examples can be PQ-encoded, Gamma 2.2, or
> linearly encoded spaces but I was grasping for a more general term;
> something that could potentially include TFs that also tone-map.

I would very much prefer to keep tone-mapping as a separate conceptual
object, but I think I see where you are coming from: the API has a
single slot for the combined coding/tone-mapping function.

Is "combined coding/tone-mapping function" too long to type? :-)

> Interestingly, the Canvas API changes presented by Christopher Cameron
> also seem to use the new colorSpace property to deal with both color
> space, as well as EOTF.
>=20
> https://www.youtube.com/watch?v=3DfHbLbVacYw4

That may be practical from API point of view, but conceptually I find
it confusing. I think it is easier to think through the theory with
completely independent color space and encoding concepts, and then it
will be easy to understand that in an API you just pick specific pairs
of them since those are enough for most use cases.

If you start from the API concepts, try to work towards the theory, and
then you are presented a display whose EOTF is measured and does not
match any of the standard ones present in the API, I think you would
struggle to make that display work until you realise that color space
and encoding can be decoupled.

A bit like how YCbCr is not a color space but a color model you can
apply to any RGB color space, and you can even pick the encoding
function separately if you want to.

Also mind that tone mapping is completely separate to all the above.
The above describe what colors pixels represent on one device (or in an
image). Tone mapping is an operation that adapts an image from one
device to another device. Gamut mapping is as well.

So describing a color space, color model, and encoding is one thing.
Adapting (converting) an image from one such to another is a whole
different thing. However, when you have hardware pixel pipeline, you
tend to program the total transformation from source to destination,
where all those different unrelated or orthogonal concepts have been
combined and baked in, usually in such a way that you cannot separate
them anymore.

Our plans for Weston internals follow the same: you have descriptions
of source and destination pixels, you have your rendering intent that
affects how things like gamut mapping and tone mapping work, and then
you compute the two transformations from all those: the transformation
from source to blending space, and from blending space to output
(monitor cable values). In the Weston design the renderer KMS
framebuffer will hold either blending space values or cable values.

Btw. another thing is color space conversion vs. gamut and tone
mapping. These are also separate concepts. You can start with BT.2020
color space color values, and convert those to sRGB color values. A
pure color space conversion can result in color values outside of the
sRGB value range, because BT.2020 is a bigger color space. If you clip
those out-of-range values into range, then you are doing gamut (and
tone?) mapping in my opinion.


...

> >> +Displays and Tonemapping
> >> +------------------------
> >> +
> >> +External displays are able to do their own tone and color mapping, ba=
sed
> >> +on the mastering luminance, color primaries, and white space defined =
in
> >> +the HDR metadata. =20
> >=20
> > HLG does things differently wrt. metadata and tone-mapping than PQ.
> >  =20
> As mentioned above I had some time to watch the HLG presentation and that
> indeed has interesting implications. With HLG we also have relative lumin=
ance
> HDR content. One challenge is How to tone-map HLG content alongside SDR (=
sRGB)
> content and PQ content.
>=20
> I think ultimately this means that we can't rely on display tonemapping w=
hen
> we are dealing with mixed content on the screen. In that case we would pr=
obably
> want to output to the display in the EDID-referred space and tone-map all=
 incoming
> buffers to the EDID-referred space.

That's exactly the plan with Weston.

The display signal space has three options according to EDID/HDMI:

- HDR with traditional gamma (which I suppose means the relative [0.0,
  1.0] range with either sRGB or 2.2 gamma encoding and using the
  monitor's native gamut)

- BT.2020 PQ

- HLG (BT.2020?)

These are what the monitor cable must carry, so these are what the CRTC
must produce. I suppose one could pick the blending space to be
something else, but in Weston the plan is to use cable signal as the
blending space, just linearised for light and limited by the monitors
gamut and dynamic range. That keeps the post-blend operations as simple
as possible, meaning we are likely to be able to offload that to KMS
and do not need another renderer pass for that.

One thing I realised yesterday is that HLG displays are much better
defined than PQ displays, because HLG defines what OOTF the display
must implement. In a PQ system, the signal carries the full 10k nits
range, and then the monitor must do vendor magic to display it. That's
for tone mapping, not sure if HLG has an advantage in gamut mapping as
well.

For a PQ display, all we can do is hope that if we tell the monitor via
HDR static metadata that our content will never exceed monitor
capabilities then the monitor doesn't mangle our images too bad.

> I think the doc needs a lot more pictures. I wonder if I can do that with=
out
> polluting git with large files.
>=20

...

> >> +Multi-plane
> >> +-----------
> >> +
> >> +In multi-plane configurations we need to solve the problem of blending
> >> +HDR and SDR content. This blending should be done in linear space and
> >> +therefore requires framebuffer data that is presented in linear space
> >> +or a way to convert non-linear data to linear space. Additionally
> >> +we need a way to define the luminance of any SDR content in relation
> >> +to the HDR content.
> >> +
> >> +In order to present framebuffer data in linear space without losing a
> >> +lot of precision it needs to be presented using 16 bpc precision. =20
> >=20
> > Integer or floating-point?
> >  =20
> Floating point. Fixed in v4.
>=20
> I doubt integer would work since we'd lose too much precision in the dark
> areas. Though, maybe 16-bit would let us map those well enough? I don't k=
now
> for sure. Either way, I think anybody doing linear is using FP16.

That's a safe assumption. Integer precision in the dark end also depends
on how high the bright end goes. With floating point that seems like a
non-issue.

What I think is "common knowledge" by now is that 8 bits is not enough
for a linear channel. However, 10 bits integer might be enough for a
linear channel in SDR.

>=20
> >  =20
> >> +
> >> +
> >> +Defining HW Details
> >> +-------------------
> >> +
> >> +One way to take full advantage of modern HW's color pipelines is by
> >> +defining a "generic" pipeline that matches all capable HW. Something
> >> +like this, which I took `from Uma Shankar`_ and expanded on:
> >> +
> >> +.. _from Uma Shankar: https://patchwork.freedesktop.org/series/90826/
> >> +
> >> +.. kernel-figure::  colorpipe.svg =20
> >=20
> > Btw. there will be interesting issues with alpha-premult, filtering,
> > and linearisation if your planes have alpha channels. That's before
> > HDR is even considered.
> >  =20
> Could you expand on this a bit?

First you might want to read
http://ssp.impulsetrain.com/gamma-premult.html
and then ask, which way does software and hardware do and expect alpha
premultiplication. I don't actually know. I have always assumed the
intuitive way for compositing in non-linear values before I understood
what light-linear means, which means I have always assumed the *wrong*
way of doing premult.

The next topic is, when you do filtering to sample from a texture that
has an alpha channel, what should the values be from which you compute
the weighted average or convolution? If I remember right, the answer is
that they must be light-linear *and* premultiplied.

So there is exactly one way that is correct, and all other orders of
operations are more or less incorrect.


> >> +
> >> +I intentionally put de-Gamma, and Gamma in parentheses in my graph
> >> +as they describe the intention of the block but not necessarily a
> >> +strict definition of how a userspace implementation is required to
> >> +use them.
> >> +
> >> +De-Gamma and Gamma blocks are named LUT, but they could be non-progra=
mmable
> >> +LUTs in some HW implementations with no programmable LUT available. S=
ee
> >> +the definitions for AMD's `latest dGPU generation`_ as an example.
> >> +
> >> +.. _latest dGPU generation: https://git.kernel.org/pub/scm/linux/kern=
el/git/stable/linux.git/tree/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_res=
ource.c?h=3Dv5.13#n2586
> >> +
> >> +I renamed the "Plane Gamma LUT" and "CRTC De-Gamma LUT" to "Tonemappi=
ng"
> >> +as we generally don't want to re-apply gamma before blending, or do
> >> +de-gamma post blending. These blocks tend generally to be intended for
> >> +tonemapping purposes. =20
> >=20
> > Right.
> >  =20
> >> +
> >> +Tonemapping in this case could be a simple nits value or `EDR`_ to de=
scribe
> >> +how to scale the :ref:`SDR luminance`. =20
> >=20
> > I do wonder how that will turn out in the end... but on Friday there
> > will be HDR Compositing and Tone-mapping live Q&A session:
> > https://www.w3.org/Graphics/Color/Workshop/talks.html#compos
> >  =20
> I didn't manage to join the compositing and tone-mapping live Q&A? Did
> anything interesting emerge from that?

I guess for me it wasn't mind blowing really, since I've been
struggling to understand things for a good while now, and apparently
I've actually learnt something. :-)

It was good (or bad?) to hear that much of the compositing challenges
were still unsolved, and we're definitely not alone trying to find
answers.

A much more interesting Q&A session was yesterday on Color creation and
manipulation, where the topics were even more to our scope, perhaps
surprisingly.

I got a grasp of how mindbogglingly complex the ICCmax specification
is. It is so complex, that just recently they have started publishing a
series of specifications that tell which parts of ICCmax one should
implement or support for specific common use cases. Hopefully the
emergence of those "Interoperability Conformance Specifications" gives
rise to at least partial FOSS implementations.

If you want to do gamut reduction, OKLab color space seems like the
best place to do it. It's not a specific gamut reduction algorithm, but
it's a good space to work in, whatever you want to do.

The Krita presentation opened up practical issues with HDR and
interoperability, and there I was able to ask about PQ and HLG
differences and learn that HLG displays are better defined.

Even EDR was also talked about briefly.

As for take-aways... sorry, my mind hasn't returned to me yet. We will
have to wait for the Q&A session transcripts to be published. Yes,
there are supposed to be transcripts!

I didn't manage to ask how EDR is handling differences in black levels.
EDR obviously caters for the peak whites, but I don't know about low
blacks. They did give us a link:
https://developer.apple.com/videos/play/wwdc2021/10161/

I haven't watched it yet.

> I've watched Timo Kunkel's talk and it's been very eye opening. He does
> a great job of highlighting the challenges of compositing HDR content.
>=20
> >> +
> >> +Tonemapping could also include the ability to use a 3D LUT which migh=
t be
> >> +accompanied by a 1D shaper LUT. The shaper LUT is required in order to
> >> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operat=
es
> >> +in perceptual (non-linear) space, so as to evenly spread the limited
> >> +entries evenly across the perceived space.
> >> +
> >> +.. _EDR: https://gitlab.freedesktop.org/swick/wayland-protocols/-/blo=
b/color/unstable/color-management/color.rst#id8
> >> +
> >> +Creating a model that is flexible enough to define color pipelines for
> >> +a wide variety of HW is challenging, though not impossible. Implement=
ing
> >> +support for such a flexible definition in userspace, though, amounts
> >> +to essentially writing color pipeline drivers for each HW. =20
> >=20
> > My thinking right now is that userspace has it's own pipeline model
> > with the elements it must have. Then it attempts to map that pipeline
> > to what elements the KMS pipeline happens to expose. If there is a
> > mapping, good. If not, fall back to shaders on GPU. =20
> > To help that succeed more often, I'm using the current KMS abstract =20
> > pipeline as a guide in designing the Weston internal color pipeline.
> >  =20
> I feel I should know, but is this pipeline documented? Is it merely, the
> plane > crtc > connector model, or does it go beyond that?

The KMS pixel pipeline model right now is just a bunch of properties in
the CRTC. These properties allude to the degamma LUT -> CTM -> gamma
LUT pipeline model, post-blending.

In Weston, we take a very similar approach. A color transformation
(which maps to a single rendering pass, or the CRTC KMS properties, or
the future per-plane KMS properties) is:

color model change -> pre-curve -> color mapping -> post-curve

- Color model change is more or less for YCbCr->RGB conversion.

- Pre- and post-curves are essentially per-channel 1D LUTs or
  enumerated functions.

- Color mapping is a 3D LUT, a matrix, or whatever else is needed.

You can see a similar structure to the KMS degamma->CTM->gamma, but
with options to plug in other defined operations in the slots so
that at least the GL-renderer can be flexible enough for everything,
even if it doesn't match KMS capabilities. Each of the slots can also
be identity (which even gets compile out of the GL shader).

Weston has one color transformation per window to go from content to
blending space, and another color transformation to go from blending to
output (cable) space.

It's not really documented, as half of that code, and more really, is
still waiting for review or to be written. Oh, I did have some plans
written down here:
https://gitlab.freedesktop.org/wayland/weston/-/issues/467#note_864054

Pre-curve for instance could be a combination of decoding to linear
light and a shaper for the 3D LUT coming next. That's why we don't call
them gamma or EOTF, that would be too limiting.

(Using a shaper may help to keep the 3D LUT size reasonable - I suppose
very much like those multi-segmented LUTs.)


...

> > Now, someone might say that the Wayland protocol design for HDR aims to
> > be descriptive and not prescriptive, so why should KMS UAPI be
> > different? The reason is explained above: *some* KMS clients may switch
> > frame by frame between KMS and shaders, but Wayland clients pick one
> > path and stick to it. Wayland clients have no reason that I can imagine
> > to switch arbitrarily in flight.
> >  =20
> I'm a bit confused about this paragraph. Wouldn't the Wayland compositor
> decide whether to use a KMS plane or shader and not the client?

What I meant is, Wayland clients will not randomly switch between doing
color transformations themselves and letting the compositor do it. They
should be able to just pick one path and stick to it as long as the
window is up.

> >> +
> >> +We would like to solicit feedback and encourage discussion around the
> >> +merits and weaknesses of these approaches. This question is at the co=
re
> >> +of defining a good API and we'd like to get it right.
> >> +
> >> +
> >> +Input and Output Transfer functions
> >> +-----------------------------------
> >> +
> >> +We define an input transfer function on drm_plane to describe the
> >> +transform from framebuffer to blending space.
> >> +
> >> +We define an output transfer function on drm_crtc to describe the
> >> +transform from blending space to display space.
> >> + =20
> >=20
> > Here is again the terminology problem between transfer function and
> > (color) space.
> >  =20
> Color value encoding? Or luminance space? Or maybe there's a different te=
rm
> altogether to describe this?

The problem in the statement is that it implies a transfer function can
do color space conversions or color space mapping.

In Weston we call it "color transformation" in an attempt to include
everything.

The input function must include the possibility for color space mapping
because you may have different planes with different content color
spaces, and blending requires converting them all into one common color
space.

Depending on what you choose as your blending space, the output
function could be just the display EOTF or something more complicated.


...

> > It's worth to note that while PQ is absolute in luminance (providing
> > cd/m=C2=B2 values), everything else here is relative for both SDR and H=
DR.
> > You cannot blend content in PQ with content in something else together,
> > until you practically define the absolute luminance for all non-PQ
> > content or vice versa.
> >=20
> > A further complication is that you could have different
> > relative-luminance transfer functions, meaning that the (absolute)
> > luminance they are relative to varies. The obvious case is blending SDR
> > content with HDR content when both have relative-luminance transfer
> > function.
> >  =20
> Good points. It sounds like we would need something akin to EDR (or
> max-SDR nits) for any relative-luminance TF, i.e. a way to arbitrarily
> scale the luminance of the respective plane.

Right. However, in the past few days, I've heard statements that
scaling luminance linearly will look not so good. What you need to do
is to follow the human visual system (HVS) characteristic and use a
gamma function. (This is not about non-linear encoding, just that the
function happens to be similar - which is not totally a coincidence,
since also non-linear encoding is meant to follow the HVS[*].) HLG OOTF
does exactly this IIUC. Naturally, these statements came from Andrew
Cotton as I recall.

* Or actually, the non-linear encoding was meant to follow cathode-ray
  tube characteristic, which by pure coincidence happens to roughly
  agree with HVS.

> > Then you have HLG which is more like scene-referred than
> > display-referred, but that might be solved with the parameter I
> > mentioned, I'm not quite sure.
> >=20
> > PQ is said to be display-referred, but it's usually referred to
> > someone else's display than yours, which means it needs the HDR
> > metadata to be able to tone-map suitably to your display. This seems to
> > be a similar problem as with signal gamut vs. device gamut.
> >=20
> > The traditional relative-luminance transfer functions, well, the
> > content implied by them, is display-referred when it arrived at KMS or
> > compositor level. There the question of "whose display" doesn't matter
> > much because it's SDR and narrow gamut, and we probably don't even
> > notice when we see an image wrong. With HDR the mismatch might be
> > noticeable.
> >=20
> >  =20
> >> +
> >> +
> >> +Describing SDR Luminance
> >> +------------------------------
> >> +
> >> +Since many displays do no correctly advertise the HDR white level we
> >> +propose to define the SDR white level in nits. =20
> >=20
> > This means that even if you had no content using PQ, you still need to
> > define the absolute luminance for all the (HDR) relative-luminance
> > transfer functions.
> >=20
> > There probably needs to be something to relate everything to a single,
> > relative or absolute, luminance range. That is necessary for any
> > composition (KMS and software) since the output is a single image.
> >=20
> > Is it better to go with relative or absolute metrics? Right now I would
> > tend to say relative, because relative is unitless. Absolute values are
> > numerically equivalent, but they might not have anything to do with
> > actual physical measurements, making them actually relative. This
> > happens when your monitor does not support PQ mode or does tone-mapping
> > to your image, for instance.
> >  =20
> It sounds like PQ is the outlier here in defining luminance in absolute
> units. Though it's also currently the most commonly used TF for HDR
> content.

Yes. "A completely new way", I recall reading somewhere advocating PQ. :-)

You can't switch from PQ to HLG by only replacing the TF, mind. Or so
they say... I suppose converting from one to the other requires making
decisions on the way. At least you need to know what display dynamic
range you are targeting I think.

> Wouldn't you use the absolute luminance definition for PQ if you relate
> everything to a relative range?
>=20
> Would it make sense to relate everything to a common output luminance
> range? If that output is PQ then an input PQ buffer is still output
> as PQ and relative-luminance buffers can be scaled.
>=20
> Would that scaling (EDR or similar) be different for SDR (sRGB) content
> vs other HDR relative-luminance content?

I think we need to know the target display, especially the dynamic
range of it. Then we know what HLG OOTF it should use. From PQ we need
at least the HDR static metadata to know the actual range, as assuming
the full 10k nit range being meaningful could seriously lose highlights
or something I guess.

Everything is relative to the target display I believe, even PQ since
displaying PQ as-is only works on the mastering display.

Since PQ content comes with some metadata, we need PQ-to-PQ conversions
for PQ display, assuming we don't just pass through the metadata to the
display. Maybe the HLG OOTF could be used for the tone mapping of
PQ-to-PQ...

I think both PQ and HLG have different standards written for how to map
SDR to them. I don't remember which ITU-R or SMPTE spec those might be,
but I suppose BT.2100 could be a starting point searching for them.


...

> Initially I was hoping to find a quick way to allow pushing video
> straight from decoder through a KMS plane to the output. Increasingly
> I'm realizing that this is probably not going to work well for a general
> desktop compositor, hence the statement here to pretty much say the
> Wayland plan is the correct plan for this: single-plane HDR (with shader
> composition) first, then KMS offloading for power saving.
>=20
> On some level I'm still interested in the direct decoder-to-KMS-to-display
> path but am afraid we won't get the API right if we don't deal with the g=
eneral
> desktop compositor use-case first.

I am very happy to hear that. :-)

> Apologies, again, if some of my response is a bit incoherent. I've been w=
riting
> the responses over Friday and today.

It wasn't at all!


Thanks,
pq

--Sig_/GtI727Fa4QfOXu+30AAzbtY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFJ3s4ACgkQI1/ltBGq
qqeEsxAAls9G/tCPACztxwRV60ISwx3xbyQ2S0JzkQ1II1GnlRb8frRCYio9JD3p
Bc+FmS4E5aMPsO6bZIIpCxUNDxINSDkML6/EqJSk15sZamxkCT40/mOvfZL4lWhU
SDzKIxB8I8L+fgmXM8DDpPzZtAercMtiyw7oVvqVRNgdeXf4qYV0cubdrkcAlu82
aNpwOMD0mWKcTmMgocqmQy+UJgpK84Dl0hTFzZeoXwdawqVz8TxKIOo/u5coSlcW
NS/glwu7HMk9oY9bCVAxaOudJ9deUqT0vA5ZUR2323nbUiiwVQypanUYGktyzSmu
Mg1Lm4QDEFVNOWE+rHDSRXG+P+t50rvZxCb/iQVPOEYQfh6z/wzQvSsbJCM343Is
D5Rh/0sTdFEM9SSzINJbsl67lqSvfG85ZRjhlMGc2h0w3orD2yRwu/K609zdodrC
QkbqS1Sjpoy7e/zkChZX8PoNjnkSfI7GmxEpIr8NbLO4ukltm+uf3OD6JTTFIsYu
tryWLSTSwo3gxP6uoTB8fYBIeKClqXl/41qFYnNkCCp4vPeWVdcuxq5BySofk5Y2
hbgK+Gsqa7ty3aJ9saJ8aV9VVeI68fj9N4zfQy3F6eeT2Ef7VnPQqboowuKZrCHF
UH7Rh68sxZeuXUaTQZ6nIgNyXtzhWEzINi6aREmP3JhKXYcN6cE=
=IUTB
-----END PGP SIGNATURE-----

--Sig_/GtI727Fa4QfOXu+30AAzbtY--
